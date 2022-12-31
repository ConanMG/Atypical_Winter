using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Ink.Runtime;
using UnityEngine.UI;

public class DialogueManager : MonoBehaviour
{

    public TextAsset inkFile;
    public TextMeshProUGUI nameText;
    public TextMeshProUGUI dialogueText;
    public GameObject choicePanel;
    public Button choiceBtn;
    public GameObject optionPanel;
    public static event Action<Story> OnCreateStory;
    private bool isWriting = false;
    private string currentSentence = "";

    public Animator anim;
    List<string> tags;

    public Story story;

    void Start()
    {
        story = new Story(inkFile.text);
        tags = new List<string>();
    }

    public void StartDialogue(Dialogue dialogue)
    {
        story = new Story(inkFile.text);
        if (OnCreateStory != null) OnCreateStory(story);

        DisplayNextSentence();

        anim.SetBool("isOpen", true);

    }

    public void DisplayNextSentence()
    {

        if (story.currentChoices.Count != 0)
        {
            ShowOptions();
        }
        else if (!story.canContinue)
        {
            if (!isWriting)
            {
                EndDialogue();
                return;
            }
        }

        if (!isWriting)
        {
            string sentence = story.Continue();
            currentSentence = sentence;
            ParseTags();
            StopAllCoroutines();
            StartCoroutine(TypeWriter(sentence));
        }
        else
        {
            StopAllCoroutines();
            dialogueText.text = currentSentence;
            isWriting = false;
        }
    }

    IEnumerator TypeWriter(string sentence)
    {
        isWriting = true;
        dialogueText.text = "";
        foreach (char letter in sentence.ToCharArray())
        {
            dialogueText.text += letter;
            yield return new WaitForSeconds(0.05F);
        }
        isWriting = false;
    }

    void ParseTags()
    {
        tags = story.currentTags;
        foreach(string tag in tags)
        {
            string prefix = tag.Split(" ")[0];
            string param = tag.Split(" ")[1];

            switch (prefix)
            {
                case "Emotion":
                    break;
                case "Place":
                    break;
                case "Speaker":
                    nameText.text = param;
                    break;
            }
        }
    }

    public void ShowOptions()
    {
        for (int i = 0; i < story.currentChoices.Count; i++)
        {
            Choice choice = story.currentChoices[i];
            Button button = CreateChoiceView(choice.text);

            button.onClick.AddListener(delegate {
                OnClickChoiceButton(choice);
            });
        }
    }

    Button CreateChoiceView(string text)
    {
        choicePanel.SetActive(true);

        Button choice = Instantiate(choiceBtn) as Button;
        choice.transform.SetParent(choicePanel.transform, false);

        Text choiceText = choice.GetComponentInChildren<Text>();
        choiceText.text = text;

        return choice;
    }

    void OnClickChoiceButton(Choice choice)
    {
        nameText.text = "You";
        RemoveChildren();
        choicePanel.SetActive(false);
        story.ChooseChoiceIndex(choice.index);
        DisplayNextSentence();
    }

    void RemoveChildren()
    {
        int childCount = choicePanel.transform.childCount;
        for (int i = childCount - 1; i >= 0; --i)
        {
            if(choicePanel.transform.GetChild(i).gameObject.tag == "ChoiceBtn")
                GameObject.Destroy(choicePanel.transform.GetChild(i).gameObject);
        }
    }

    public void EndDialogue()
    {
        StartCoroutine(TypeWriter("THE END"));
        Debug.Log("End of conversation");
        anim.SetBool("isOpen", false);
    }
}

using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using Ink.Runtime;
using UnityEngine.UI;

public class DialogueManager : MonoBehaviour
{

    public TextMeshProUGUI nameText;
    public TextMeshProUGUI dialogueText;
    public GameObject choicePanel;
    public GameObject choiceBtn;
    public GameObject myCanvas;
    public GameObject characterFace;
    public GameObject characterBody;

    public static event Action<Story> OnCreateStory;
    private bool isWriting = false;
    private string currentSentence = "";

    public TextAsset inkFile;
    public Story story;
    List<string> tags;


    void Start()
    {
        story = new Story(inkFile.text);
        tags = new List<string>();
        StartDialogue();
    }

    public void StartDialogue()
    {
        story = new Story(inkFile.text);
        if (OnCreateStory != null) OnCreateStory(story);

        DisplayNextSentence();

    }

    public void DisplayNextSentence()
    {

        if (story.currentChoices.Count != 0)
        {
            if (!choicePanel.activeSelf)
            {
                ShowOptions();
                StopAllCoroutines();
                dialogueText.text = currentSentence;
                isWriting = false;
            }
            else
                return;
        }

        if (!story.canContinue)
        {
            if (!isWriting && story.currentChoices.Count ==  0)
            {
                EndDialogue();
            }
            return;
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
                case "Hide":
                    characterBody.SetActive(false);
                    characterFace.SetActive(false);
                    break;
                case "Show":
                    characterBody.SetActive(true);
                    characterFace.SetActive(true);
                    break;
                case "Body":
                    switch (param)
                    {
                        case "Bloody":
                            characterBody.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[1];
                            break;
                        case "Relaxed":
                            characterBody.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[2];
                            break;
                    }
                    break;
                case "Emotion":
                    switch (param)
                    {
                        case "Sad":
                            characterFace.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[10];
                            break;
                        case "Happy":
                            characterFace.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[12];
                            break;
                        case "Annoyed":
                            characterFace.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[3];
                            break;
                        case "Overjoyed":
                            characterFace.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[9];
                            break;
                        case "Cry":
                            characterFace.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[8];
                            break;
                        case "Embarrassed":
                            characterFace.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[6];
                            break;
                        case "Indifferent":
                            characterFace.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[4];
                            break;
                        case "Smile":
                            characterFace.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[11];
                            break;
                        case "Furious":
                            characterFace.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[7];
                            break;
                        case "Bash":
                            characterFace.GetComponent<Image>().sprite = Resources.LoadAll<Sprite>("Sprites/Eira_Sprite")[5];
                            break;
                    }
                    break;
                case "Place":
                    switch (param)
                    {
                        case "Inside":
                            myCanvas.GetComponent<Image>().sprite = Resources.Load<Sprite>("Images/Living_Room_Pixelart");
                            break;
                        case "Outside":
                            myCanvas.GetComponent<Image>().sprite = Resources.Load<Sprite>("Images/Doorstep_Pixelart");
                            break;
                        case "Clinic":
                            myCanvas.GetComponent<Image>().sprite = Resources.Load<Sprite>("Images/Clinic_Pixelart");
                            break;
                        case "Mountain":
                            myCanvas.GetComponent<Image>().sprite = Resources.Load<Sprite>("Images/Snowy_Mountain_Pixelart");
                            break;
                        case "Window":
                            myCanvas.GetComponent<Image>().sprite = Resources.Load<Sprite>("Images/Window_Pixelart");
                            break;
                    }
                    break;
                case "Speaker":
                    nameText.text = param;
                    break;
            }
        }
    }

    public void ShowOptions()
    {
        RemoveChildren();
        for (int i = 0; i < story.currentChoices.Count; i++)
        {
            Choice choice = story.currentChoices[i];
            GameObject button = CreateChoiceView(choice.text);

            button.GetComponent<Button>().onClick.AddListener(delegate {
                OnClickChoiceButton(choice);
            });
        }
    }

    GameObject CreateChoiceView(string text)
    {
        choicePanel.SetActive(true);

        GameObject choice = Instantiate(choiceBtn) as GameObject;
        choice.transform.SetParent(choicePanel.transform, false);

        TextMeshProUGUI choiceText = choice.GetComponentInChildren<TextMeshProUGUI>();
        choiceText.text = text;

        HorizontalLayoutGroup layoutGroup = choice.GetComponent<HorizontalLayoutGroup>();
        layoutGroup.childForceExpandHeight = false;

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

        choicePanel.SetActive(true);
        GameObject choice = CreateChoiceView("Restart?");

        choice.GetComponent<Button>().onClick.AddListener(delegate {
            new SceneLoader().LoadScene("MainMenu");
        });
    }
}

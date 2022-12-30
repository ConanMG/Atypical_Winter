using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using TMPro;

public class DialogueManager : MonoBehaviour
{
    public TextMeshProUGUI nameText;
    public TextMeshProUGUI dialogueText;
    private bool isWriting = false;
    private string currentSentence = "";

    public Animator anim;

    public Queue<string> text;

    void Start()
    {
        text = new Queue<string>();
    }

    public void StartDialogue(Dialogue dialogue)
    {
        anim.SetBool("isOpen", true);

        nameText.text = dialogue.name;

        text.Clear();

        foreach (string sentence in dialogue.sentences)
        {
            text.Enqueue(sentence);
        }

        DisplayNextSentence();

    }

    public void DisplayNextSentence()
    {
        if(text.Count == 0)
        {
            EndDialogue();
            return;
        }

        if (!isWriting)
        {
            string sentence = text.Dequeue();
            currentSentence = sentence;
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

    IEnumerator TypeWriter (string sentence)
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

    public void EndDialogue()
    {
        Debug.Log("End of conversation");
        anim.SetBool("isOpen", false);
    }
}

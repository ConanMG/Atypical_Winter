using System;
using System.Collections;
using System.Collections.Generic;
using TMPro;
using UnityEngine;

public class DialogueSystem : MonoBehaviour
{
    public static DialogueSystem instance;
    [SerializeField]
    public GameObject speechPanel;
    [SerializeField]
    public TextMeshProUGUI nameText;
    [SerializeField]
    public TextMeshProUGUI dialogueText;

    public bool isWriting {get {return writing != null;}}
    Coroutine writing = null;
    [HideInInspector] public bool isWaitingForUserInput = false;

    IEnumerator Writing(string targetSpeech, string speaker)
    {
        speechPanel.SetActive(true);
        dialogueText.text = "";
        nameText.text = speaker;
        isWaitingForUserInput = false;

        while (dialogueText.text != targetSpeech)
        {
            dialogueText.text += targetSpeech[dialogueText.text.Length];
            yield return new WaitForSeconds(0.05F);
        }

        isWaitingForUserInput = true;
        while (isWaitingForUserInput)
            yield return new WaitForSeconds(0.05F);

            StopWriting();
    }

    private void Awake()
    {
        instance = this;
    }

    public void DialogueWrite(string targetSpeech, string speaker)
    {
        speechPanel.GetComponent<Animator>().SetBool("isOpen", true);
        StopWriting();
        writing = StartCoroutine(Writing(targetSpeech, speaker));
    }

    public void StopWriting()
    {
        if (isWriting)
        {
            StopCoroutine(writing);
            writing = null;
        }
    }
}

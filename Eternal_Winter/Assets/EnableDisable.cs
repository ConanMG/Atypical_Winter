using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class EnableDisable : MonoBehaviour
{
    public AudioSource audio;
    public bool isEnabled = false;

    public void ButtonClicked()
    {
        isEnabled = !isEnabled;
        audio.mute = isEnabled;
        if(isEnabled)
            GetComponent<Image>().sprite = Resources.Load<Sprite>("Images/Mute");
        else
            GetComponent<Image>().sprite = Resources.Load<Sprite>("Images/Sound");
    }
}

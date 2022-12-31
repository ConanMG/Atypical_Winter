VAR examined = false
VAR checked_wound = false
VAR lies_caught = 0
VAR affection = 0
VAR hints = 0
VAR mention = false
VAR hide_identity = false
VAR offered_house = false
VAR work_selected = 0
VAR guessed = false

    #Speaker Narrator
You awaken in the middle of the night to the sound a low gutural growl followed by a strong thud against the ground and a tremor. 

You sluggishly stumble towards the window to find the root of the sound. Peeking you find something you were not expecting. 

Heavy snowfall piercing the veil of night that covered the town of Veliwood, which in itself wouldn't be considered strange, were it not for the fact that it is midsummer. Before you could gather your thoughts you hear a knock on your door. 

Confused, you saunter over to the door and open0 it to find a beautiful woman, white as snow from her long pointy ears to her bare feet, donning long snow white robes. Two big horns protude from the back of her head and wrap around it coming towards the forehead.

    #Speaker Eira
Pant pant Excuse me, sir. I'm sorry to bother you on this gloomy night, but I'm afraid I got caught in the middle of the storm. May I please come in?

 * Of course, please come in.
    -> accepted
 * No way, no stranger is coming into my house.
    -> rejected_end
 * [Examine her.]
    ~ affection--
        -> examination_outside

=== accepted ===

    #Speaker Narrator
You usher her in and guide her towards the living room after shutting the door. There you accomodate her and after few moments you notice that the room is quite colder than it was before.

    #Speaker Eira
Thank you, kind sir. I'm in your debt, I might have frozen out there.

    #Speaker You
No problem, miss...

    #Speaker Eira
Oh! Eira, my names Eira.

    #Speaker You
Right, miss Eira.

-> accepted_choices

    = accepted_choices
    
    * { lies_caught >= 2 && not confront_lies } [Don't lie to me]
    If you don't want to answer my questions that's fine, but I'd prefer you didn't lie to me. -> confront_lies
    
    * { examined && !checked_wound } How did you get that gash on your abdomen?
    
    #Speaker Eira
        I... got attacked by a wolf. I was running from them when I got to your house.
    
    #Speaker Narrator
        Her statement seems unlikely to you, not only because of her stuttering, but because there are no wolves near Veliwood and haven't been for years.
    
        ~ lies_caught++
        ~ checked_wound = true
        
        -> accepted_choices
    
    * { examined && checked_wound } May I see that wound of yours? I am a doctor you know
    
    #Speaker Eira
        NO! No... I'm sorry for screaming. I just don't wish bother you any further.
    
    #Speaker Narrator
        She recoils back into the couch nervously and holds her abdomen once again. The wound is slowly, but surely becoming more noticeable as a shade of red taints her white clothes. 
        
        -> insist
    
    * Where did you come from?
    
    #Speaker Eira
        I came from... a hut in the forest where I live alone. It was destroyed by the storm and I was forced to move.
        
    #Speaker Narrator
        Having lived in Veliwood from the day you were born, you have amasse quite a bit of knowledge of not only the town, but of it's surroundings. This knowledge allows you to say with certainty that there is no hut in those woods.
        
        ~ lies_caught++
        
        -> accepted_choices
        
    * Are you not cold? Your limbs are covered in frostbite.
    
    #Speaker Eira
        Having been in this mountains for so long, I'm somehow accustomed to the freezing cold that comes with winter. Besides, the cold never bothered me anyway.
        
    #Speaker Narrator
        This explanation might have convinced someone without the medical knowledge you possess, however, being the only doctor in Veliwood you have come across a whole lot of frostbite cases. There is no chance someone could shake off frostbite like she has without even flinching.
        
        ~ hints++
        ~ lies_caught++
        
        -> accepted_choices
        
    * { not examination_outside } [*Examine her*] -> examination_inside
    
    * [*Offer her a hot drink*] -> mistrustful

    = insist
    
    * Look, I am trying to help you
    <>, but I cannot do that if you don't trust me a little. Help me help you Eira.
    -> healed
    * Why so defensive?
        <>Are you hiding something, I might have to ask you to leave if you keep acting suspicious.
    -> angered_end
    * Fine then, have it your way.
    -> accepted_choices
    
    = examination_inside
    
    #Speaker Narrator
        Now in the heat and comfort of the house, you take a moment to thoroughly examine her.
        
        She is a stunning woman. Her saphire eyes are highlighted by the porcelain tone of her skin.
        
        The long cascade of snow white that flows from atop her head ending on a blue hue on the tips that shapes her hair, resembles a melting icicle. Though some areas of her body seem to be frostbit she doesn't show the slightest sign of hypothermia. 
        
        Nevertheless, you can see a shade of crimson that pours from under her right hand that tightly grips her left side.
        ~ examined = true
    
    -> accepted_choices

->END
=== confront_lies ===

    #Speaker Eira
What are you talking about? I- I don't know what you mean.

* Trust me, I am not here to judge.
    <>I just want to know some more about you so that I can help you. Is that okay with you? 
    ~ affection ++
    -> relaxed
* You don't, because I can smell a filthy liar from miles away.
    -> angered_end
* If that's how you wanna play it...
    -> accepted.accepted_choices
    
=== angered_end ===

    #Speaker Eira
I am so tired of you puny little creature. I was trying not to make a ruckuss, but I grow tired of your aggression against me. You can blame what is about to happen on no other than yourself.

    #Speaker Narrator
Before you get a moment to retaliate Eira's mouth opens gleaming with a supernatural aura and a burst of frigid energy springs towards you completely freezing you in place. 

The last thing you see is her figure approaching to your frost statue of a body and whispering "Good riddance" as she cracks the statue.

->END
=== rejected_end ===

    #Speaker Eira
You leave me no choice then. I'll have to risk it. You brought this upon yourself you insolent little creature.

    #Speaker Narrator
The lady's charming visage abruptly transmogrifies into that of a white-scaled lizard-like beast with piercing draconic eyes and claws sprout from the tip of her fingers. 

The light begins to leave your eyes as her right hand swiftly pierces through your chest.

As your conciousness fades, you can help but ask yourself what would have happened had you been a good samaritan.

-> END
=== examination_outside ===

    #Speaker Narrator
You take a moment to thoroughly examine her. She is a stunning woman. Her saphire eyes are highlighted by the porcelain tone of her skin.

The long cascade of snow white that flows from atop her head ending on a blue hue on the tips that shapes her hair, resembles a melting icicle. 

Though some areas of her body seem to be frostbit she doesn't show the slightest sign of hypothermia. Nevertheless, you can see a shade of crimson that pours from under her right hand that tightly grips her left side.

    #Speaker Eira
Is something wrong, sir. It's getting quite cold in here, may I please come in?

~ examined = true

-> examination_choices

    = examination_choices
     * Yes, yes, come in, before it gets any colder.
     -> accepted
     * No way, I'm letting such a suspicious looking stranger into my house.
     -> rejected_end
     * Could you tell me about that injury first *Point at her side*.
         
        ~ checked_wound = true
        ~ lies_caught++
        
    #Speaker Eira
        It's nothing... I... got hit by a branch that was flown by this fierce wind we are having.
        
    #Speaker Narrator
        The lady in white suspiciously stuttered through that sentence, but you don't really know if the stutter came from the time it took to make up a convincing excuse or because of the blood loss her body has sustained.
        
        -> examination_choices
=== healed ===

    #Speaker Narrator
Eira looks at you right in the eye and the room falls silent for a moment. The guarded façade she had been keeping during this whole time slowly drops as she looks at her abdomen, lifts her hand from it and looks right back at you.

    #Speaker Eira
Don't be too harsh, doctor.

    #Speaker Narrator
You kneel right before her and probe the area around the cut. She lets out muffled moans of pain as you feel the cut, it is deep and on the first stages of infection. 

Had you not decided to check it out, she might have died in less than an hour. Luckily for her, she stumbled upon the house of Veliwood's best (and only) doctor. 

You go to your office and pick some of your equipment and begin disinfecting the wound. Having washed it and cleaned it, you then sew it up. 

Eira is in pain all the way through the process, however she seems to have a high pain tolerance and keeps herself together all the way through it.

    #Speaker You
It is done!

    #Speaker Eira
Is it? Thank you very much, doctor. How may I repay your kindness?

~ affection ++

* { lies_caught >= 2 && not confront_lies } How about you answer my questions truthfully from now on?
    -> confront_lies

* { not confront_lies } Don't sweat it
<>, I am a doctor after all. I can't have my guest bleed out in my house.
    -> bed
=== mistrustful ===

    #Speaker Narrator
You offer Eira a hot drink and chat with her for a while until you start to feel tired again.

* [*Go to bed*] -> bed

* [*Chat more*] -> accepted.accepted_choices

-> END
=== relaxed ===

    #Speaker Narrator
After your heart-warming concerns and your respect for her privacy, Eira seems to feel more at ease. You can see her stiff guarded posture drop and a more lax demeanor taking over her. She seems more open to your questions now.

* So, how did you really get that wound?
    -> hunted
* Tell me, where did you really come from?
    -> hunted.home_suggestions
=== hunted ===

    #Speaker Eira
I was being hunted by a party of people. They attacked me and I fled, wounded, until I stumbled upon your house.
-> hunted_choices

= hunted_choices
    
    * Why were they hunting you?
    
    #Speaker Eira
        I... I don't know, I'm sorry. However I can tell you that I had no ill intention towards them and they attacked me out of nowhere.
        
        -> hunted_choices
    
    * Do you know if they followed you?
        
    #Speaker Eira
        I am not sure, but I hardly doubt it. I ran really fast and with this storm on top of that.
        
        -> hunted_choices
    
    * Were you hurt anywhere else?
        
        Eira gives you a sorrowful yet sweet smile.
        
    #Speaker Eira
        I wasn't, thanks for asking. I don't think anyone has been that concerned by me in... Well, ever actually.

        ~ affection++
        
        -> hunted_choices
        
    * Do you have a place to get back too?
    
    #Speaker Eira
        Not really, most of my life I have been traveling from one place to another. I don't have a family or anyone to go back to either.
        
        -> home_suggestions
    
    * [Well, it's getting late.]
        -> bed
        
    * -> bed

= home_suggestions

    * I can take you to see the town's elder, he will most likely offer you options.
        
    #Speaker Eira
        You have given me so much already, I don't want to keep asking for things, but could you do me a favor? 
        
        Could you pretend that I'm an old acquaintance of yours? I just don't want the people who followed me to possibly find me.
        
            ** Sure, I can do that for you.
            
                Thank you, really.
                
    #Speaker You
                We should think of somewhere else for you to stay, then.
                
                ~ hide_identity = true
                
                -> home_suggestions
            
            ** I'm sorry, I'm not good at lying. 
            
    #Speaker You
            I can avoid mentioning you, tho.
                
    #Speaker Eira
                That would be fine too, I guess.
                
    #Speaker You
                We should think of somewhere else for you to stay, then.
                
                -> home_suggestions
        
    * You could stay here for a while if you want.
        
    #Speaker Narrator
        She looks at you, confused.
        
    #Speaker Eira
        Do you even listen to what you are saying?! You don't even know me and I'm not answering most of your questions. I could be a serial killer for all you know. Are you out of your mind?!
        
        ~ offered_house= true

        ~ affection++
        
        ** I trust you.
        
            Besides if you wanted to do something you would have done it already, right
            
    #Speaker Narrator
            Her cheeks turn a light shade of red as she looks down.
            
    #Speaker Eira
            Thank you, I will take it into consideration.

            ~ affection++
        
            -> bed
        
        ** You are right.<>
        I'm sorry for saying something like that out of the blue.
        
            -> home_suggestions
        
    * [Time to go to bed]
        
        I suppose we can think about that in the morning.
        
        -> bed
        
        
=== bed ===

    #Speaker You
    Well, it's getting late and I have to work tomorrow. You should go to sleep too.
    
    #Speaker Eira
    Do you have a place where I can bed down for the evening?
    
    * You can take my bed. I'll sleep on the couch.
        
    #Speaker Eira
        Are you sure? I can sleep in the couch, I'm the unexpected visitor after all.
        
        Don't worry, what kind of host would let his guest sleep on the couch?
        
    #Speaker Eira
        If you insist... Thank you once again, doctor. Good night.
        
        Good night, miss Eira.
        
        ~ affection++
        
        -> morning
        
    * You can take the couch.
        
    #Speaker Eira
        Thanks, I couldn't ask for anything else. Have a good night.
        
    #Speaker You
        Goodnight then.
        
        -> morning
        
    * We could both fit in my bed.
    
    #Speaker Eira
        T-That wouldn't be appropriate. I will take the couch if you don't mind, thank you.
        
    #Speaker Narrator
        She looks at you with an angered expression from which you gather your quick indecent response wasn't well received.
        
    #Speaker You
        It was just a joke, don't take it to heart. I'm sorry. Sleep well.
        
        ~ affection--
        
        { examination_outside | examination_inside: ->morning }
        { not examination_outside | not examination_inside: -> bleed_out_end }
        
=== bleed_out_end ===

    #Speaker Narrator
    You wake up in the morning and go directly to your window to see if anything changed. However, the weather outside is still just as if it was winter. The blizzard rages on and the freezing cold still lingers in the air.

    #Speaker Narrator
    You go check on your guest and find her right where you left her, but everything is covered in blood now. She is not moving and when you go check she isn't breathing either. 
    
    #Speaker Narrator
    It seems she was hiding a wound out of fear and mistrust and now is to late. You can't stop blaming yourself after that. What kind of doctor wouldn't notice such an amount of bloodloss. 
    
    #Speaker Narrator
    You closed your clinic that day and fell into a spiral of self-loathing for a while.
    
    -> END
    
=== morning ===

    #Speaker Narrator
You wake up in the morning and go directly to your window to see if anything changed. However, the weather outside is still just as if it was winter. The blizzard rages on and the freezing cold still lingers in the air.

    #Speaker Narrator
You go check on your guest and find her right where you left her, still soundly asleep. You figure it's normal for her to be tired after all she lived through yesterday.
    
    -> morning_choices

    = morning_choices
        * [\*Check her wound*]
            
    #Speaker Narrator
            You slowly scan her wound up and down. It looks much better after your treatment and a good night sleep.
            
    #Speaker Narrator
            There is no sign of infection and the wound is even beginning to close, this strikes you as odd. Normally a wound that deep would take months to heal.
            
            ~ hints++
                
            -> morning_choices
            
        * { not wake_up } [\*Wake her up*]
            -> wake_up
        * [\*Prepare for work*]
            
    #Speaker Narrator
            You prepare breakfast and ready yourself up for work. { wake_up: -> work | -> wake_up }
            
=== wake_up ===
    
    #Speaker Narrator
        You get on your knees next to Eira's figure and gently shake her awake. She slowly comes to conciousness and looks at you scared, before the memory of what happened last night seems to sink in. 
        
    #Speaker Narrator
        Then, her calm look from the day before comes back to her face. She stretches and yawns.
        
    #Speaker Eira
        Good morning, doctor.
        
    #Speaker You
        Good morning, miss Eira. How was your night?
        
    #Speaker Eira
        It was great, thanks to you. I cannot thank you enough.
        
    #Speaker You
        What do you plan to do now?
        
    #Speaker Eira
        I... I don't know. I guess I need to lay low for a while, but I don't know where I could do that.
        
        Well, { offered_house: like I said yesterday } you can stay here for a while if you want.
        
    #Speaker Eira
        I don't know, I don't wanna impose on you any longer.
        
    #Speaker You
        It's really no problem, though.
        
    #Speaker Eira
        It would only feel right for me to accept that offer if you had something for me to do so that I can repay you.
        
        -> wake_up_choices
        
        = wake_up_choices
        
            * Actually, I was looking for an assistant in my clinic. <>
                -> clinic
                
            * You could take care of the shores here at home. <>
                -> housewife
                
            * We can ask around the town.<> 
                Who knows? Maybe someone is looking for a new employee.
                
    #Speaker Eira
                That would be fine with me, though I would prefer to be working under your care.
                
                ~ work_selected = 2
                
                -> morning.morning_choices
                
        = housewife
    #Speaker You
                As you can see I don't really have the time to take care of them on my own. In fact, I was thinking of hiring a maid a from town to take care of it.
                
    #Speaker Eira
                I could certainly take care of that, yes. But, wouldn't people begin to suspect things? 
                
                You know, a man and a woman living under the same roof, she takes care of the house while he works. 
                
                It just sounds like an old school married couple. I don't wanna inconvinience you like that.
                
    #Speaker You
                * It's really no problem at all<>
                , besides they will start rumours anyways. There aren't many other things that can get people's interest in a small town as gossip does.
                    
    #Speaker Eira
                If you insist. I will do this for you, then.
                
                ~ work_selected = 1
                
                -> morning.morning_choices
                
                * Yeah, you might be right. Let's weight some other options.
                
                -> wake_up_choices
                
        = clinic
    #Speaker You
            Maybe you could help with that.
        
    #Speaker Eira
            I don't know... I don't think I'm qualified for that.
            
            * It will be fine. I just need you to greet the clients.<>
                You would be kind of a receptionist and every now and then I would need you to fetch me somethings, but nothing further than that.
                
    #Speaker Eira
                If you think I'm fit for it, then I can take care of it.
                
                ~ work_selected = 0
                
                -> morning.morning_choices
            
            * Maybe you are right, let's consider some other ideas.
            
                -> wake_up_choices
=== work ===

{ not hide_identity:
    ~ affection--
}
{ work_selected:
    -0: ->clinic
    -1: ->housewife
    -2: ->town
}


= clinic

    #Speaker Narrator
    After readying up, you and Eira head to your clinic in the heart of Veliwood. On your way there you are stopped by many of the towns residents that seem curious about your companion and complain about the weather.
    
    { hide_identity: As you promised her, you try and hide her identity introducing her as a friend from far away who's gonna spend some time with you. | You introduce her to the towns people saying as little as you can, not to arouse suspicion. All the way through your awkward introductions she seems extremely uncomfortable. }
    
    You finally arrive at the clinic and waiting right in front of the door you find a whole line of people. 
    
    They all look at you and begin to berate you with complaints of aches and diseases of all kinds, most likely as a result of this sudden shift in the weather.
    
    Quickly going in, you explain the ropes of her new job to Eira and she starts taking note of the patients discomforts. 
    
    Surprisingly for how she presented herself, she is really capable at this job and your work load is cut in half by having someone taking notes for you.
    
    Not but four hours later you two have efficiently tended to all of your patients. 
    
    Some of them stay for a while to chit-chat with you and to inquire about your new partner and compliment her skills. After they all leave you are left alone with Eira again.
    
    #Speaker You
    How was that for a first day?
    
    #Speaker Eira
    Is this always so busy?
    
    #Speaker You
    No, it hasn't being this crowded for quite a while actually. Seems this shift of the weather sure took a toll on people's health.
    
    #Speaker Eira
    I'm sorry...
    
    ~ hints++
    
    #Speaker You
    Did you say something?
    
    #Speaker Eira
    No, nevermind. It's nothing.
    
    #Speaker You
    So, do you think you could stay and lend me a hand?
    
    #Speaker Eira
    Yes, gladly.
    
    -> complaints
    
= housewife

    #Speaker Narrator
    You leave Eira home and leave for work. On your way to the clinic you are stopped by lots of people who complain to you about how the weird climate shift that took place last night has got them feeling under the weather.
    
    #Speaker Narrator
    When you arrive at your office, you find a tremendously long line of patients, probably because of the same reason you had discussed with so many people on your way. 
    
    #Speaker Narrator
    You spend the whole day tending to patients and get home late at night.
    
    #Speaker Narrator
    Once at home, you find everything as if the house was rebuillt. Your house hasn't been this clean probably since it was built. 
    
    #Speaker Narrator
    Standing at the kitchen's door, you see Eira, fully geared up, apron on and spoon in hand.
    
    #Speaker Eira
    How was your day?
    
    #Speaker You
    Much better now, you have done an amazing job.
    
    #Speaker Eira
    This is nothing, seriously. Besides, you seem to have had it pretty rough yourself, am I right?
    
    #Speaker You
    That you are, there were so many patients. This climate shift is gonna be the end of me.
    
    #Speaker Eira
    ...
    
    ~ hints++
    
    #Speaker You
    You okay?
    
    #Speaker Eira
    Yes, yes, it's nothing. Dinner is ready if you want to eat now.
    
    #Speaker You
    That would be wonderful, thank you. So, can I take this as to you staying then?
    
    #Speaker Eira
    I think so, at least for a few weeks. Until I can find another place to be.
    
    #Speaker You
    I'm happy to hear that.
    
    -> complaints
    
= town

    #Speaker Narrator
    You take Eira to the elder's house and ask him if there is something where she could be needed. 
    
    The elder says she will find something for her, and so you leave for work. On your way to the clinic you are stopped by lots of people who complain to you about how the weird climate shift that took place last night has got them feeling under the weather.
    
    When you arrive at your office, you find a tremendously long line of patients, probably because of the same reason you had discussed with so many people on your way. You spend the whole day tending to patients and get home late at night.

    Eira greets you at the door and you talk for a few minutes about her new job at the town's bakery. Too tired for anything else, the both of you call it a day and go to sleep.
    
    -> complaints


->DONE
=== complaints ===

    #Speaker Narrator
    A month flies by quickly and the weather doesn't seem to improve since Eira's arrival. The townsfolk have begun calling her bad omen and some of them even go as far as to call her witch.
    
    { work_selected:
        -0: -> hardship
        -1: -> uneasy
        -2: -> fired
    }
    
= fired

    #Speaker Narrator
    This rumours began to repercuss on the bakery and so the owner fired Eira. Since then she had been feeling down and she had repeatedly let you know that she felt guilty. 
    
    She began taking care of the shores while you were out, claiming that doing so at least she felt like she wasn't freeloading as much.
    
    You knew all this, but you were to busy dealing with your neighbours complaints to even have the time to talk to her. That was until tonight. She had been waiting for you to come back home by the door to confront you when you came home.
    
    -> complaints_choices

= hardship

    #Speaker Narrator
    Driven by this rumours your clients began to stir clear of your clinic. More and more people have fallen victim to several diseases, but still refuse to visit your clinic. 
    
    As you begin to run short on funds and people succumb to their diseases, Eira feelings of guilt grow by the day.
    
    She has stated to you several times how awful she feels about this things happening because of her. She constantly reminds you that you are in no need to aid her and that you could cast her out anytime you wanted.
    
    Tonight, when you arrive home you find her waiting for you at the door to confront you.
    
    -> complaints_choices

= uneasy

    #Speaker Narrator
    The townsfolk have been knocking at your door every other day to demand of you that she leaves and you have ignored their demands all this time. However, the biggest issues come with Eira's mood.
    
    She has been feeling down and her guilt has been growing by the day. She has made this clear to you more frequently during the last few weeks and today she has finally decided to confront you about it.
    
    -> complaints_choices
    
= complaints_choices

    #Speaker Eira
    I cannot take this anymore. I am being an inconvinience to you and a nuisance to everyone in town. I have to leave and you know it.
    
    #Speaker You
    But Eira, what they are accusing you of is absolutely ludicrous. { hints >= 3: Right? } You cannot give in to pressure and leave just because of that.
    
    { affection >= 5: -> confession }
    
    #Speaker Eira
    Right. But, regardless I cannot stay any longer. I would just be making everyone uncomfortable. I-
    
    -> hunters_arrive
    
= confession

    #Speaker Eira
    Yeah... about that. Doctor, there is something I've been meaning to tell you. I am not what I might look like.
    
    { hints >= 3: I think I might know where this is going. -> guess | -> explanation }
    
= guess

    #Speaker You
    I know you are not a humanoid being like me or the townsfolk. The speed at which your wounds heal, your resistance to this freezing cold, your high tolerance to pain, not to mention this weather that seems to follow you around. I know.
    
    * You are indeed an ice witch.
    
        ~ guessed = false
        
        -> explanation
    
    * You are a white dragon.
    
        ~ guessed = true
    
        -> explanation
    
    * You are a yuki-onna
    
        ~ guessed = false
        
        -> explanation
    
    
= explanation

    #Speaker Eira
    { guess && not guessed: You are halfway right. I am indeed no humanoid, but that's not exactly what I am. <br><br> You remember that sound you heard during the first day of the blizzard? <br><br> That was me, I fell from the sky that day. <br><br> I am a white dragon. }
    
    { guess && guessed: That I am. }
    
    #Speaker Eira
    I was being hunted by a party of monster slayers sent by the newly founded kingdom that spawned next to my lair not but a few hundred years ago.
    
    But as I told you, I never attacked them nor did I have the intention to. They came into my house to slay me because I was an inconvinience, just like I am right now.
    
    Unlike my dragon brethren I don't enjoy killing. I just wanted a peaceful life of coexistence with humanoids, but wherever I go, calamity follows and people hate me for it.
    
    { affection >= 5: Until I found you. You have treated me fairly, you have given me a place to stay and you have even defended me from other people. }
    
     That's why I cannot inconvinience you any longer.

    -> hunters_arrive
    
=== hunters_arrive ===

    #Speaker Narrator
    \*Knock knock knock*
    
    While you are talking you hear a knock on your door once again. Right as the door sounds Eira's { relaxed: calmed } demeanor rapidly shifts into panic. Her face shows an expression of pure fear like if she had seen a ghost.
    
    #Speaker Eira
    { hunted: They are here. The hunters. }
    
    #Speaker You
    How do you know?
    
    #Speaker Eira
    { complaints.confession: I can smell them. | I just do. Trust me. }
    
    #Speaker You
    Okay, don't fret. I will be right back.
    
    -> hunters_talk
    
=== hunters_talk ===

    #Speaker Narrator
    Still hearing the constant knocking you walk to the door and open it to find quite an arrangement of personalities. 
    
    #Speaker Narrator
    A party of adventurers comprised of a dwarven man with a big warhammer attached to his side wearing plate armor, an elven lady with a longbow and studded leather wears, and a fully covered in armor person with a symbol of The Light Bearer and a greatsword on his back.
    
    #Speaker ???
    Excuse me sir, we know it's quite late, but may we have a word with you?
    
    * Sure, what can I do for you on this cold night?
    
        -> hunters_questions
        
    * I'm really sorry<>
    , I don't tend to anyone past twelve o'clock. I might have to ask you to head to my clinic tomorrow.
    
    #Speaker ???
        I'm afraid that's not an option, we are tracking a very dangerous thing and just need you to answer a few questions.
        
        -> hunters_questions

    = hunters_questions

    #Speaker ???
        Did you see something odd this night?
        
        * You mean besides the permanent snowstorm during the summer season, or...?
        
    #Speaker ???
            We are looking for the cause of it.
            
            That's great. Have you found anything, yet?
            
    #Speaker ???
            We are tracking a very dangerous creature. We were pointed to your house by the neighbours, so I would appreciate if you dropped the satire and answered my questions.
            
    #Speaker ???
            Where is the woman they called witch.
            
            -> hide
        
        * What would you describe as weird.
        
    #Speaker ???
            From what your neighbours told us, a woman that shifts the weather type of weird.
            
            -> hide
            
        * \*whisper* I think the thing you are looking for is in my house
        
            -> betrayal_ending
-> END
=== hide ===

* [*Dismiss accusations*]
    They are just shaken by this weather. There is no witch in this town.

    #Speaker ???
    Then you wouldn't mind if we stepped in to check for ourselves, right?
            
    #Speaker You
            ** By any means. Please, come in.
            
                However, my house is really small so I might have to ask that only one of you comes in.
            
    #Speaker Narrator
                The dwarf is about to say something when the elven woman raises her hand and he stops immediately.
                
    #Speaker ???
                That's fine, I will go.
            
            -> home_talk
            
            ** I would rather we stay here.
            
            -> hesitant

* [*Fake Ignorance*]
    I am so tired of explaining that there is no such thing in my house.

    Could you please leave.
    
    -> hesitant


    = hesitant
        
    #Speaker You
        I don't mean to offend, but I don't know you and it's quite late. So I would rather not have you in my homestead.
        
    #Speaker ???
        I mean this with all due respect, that is of little concern to us. We were sent by the king of Windalia to slay the ancient white dragon that purges the west.
        
        * How about this, you may come in, but just one of you.
        
            That way I can feel sure and we can discuss whatever you need.
            
    #Speaker ???
            That would be fine, I will come in.
            
            -> home_talk
            
        * Well, I can't know that for sure, so unless you bring me some evidence to check the veracity of your claims, I won't let you in.
        
    #Speaker Narrator
            The elven lady frowns and after a few seconds sighs deeply.
            
    #Speaker ???
            Alright then, how about we get here tomorrow, first thing in the morning with a warrant for her arrest?
            
    #Speaker You
            That would be very much appreciated, thank you.
            
    #Speaker ???
            No funny business. Got it?
            
    #Speaker You
            I wouldn't even think about it.
            
            -> flee
=== home_talk ===

    #Speaker Narrator
    You and the elven lady come into the house and you escort her towards the living room. There shaking in fear is Eira, who pales at the sight of the elf.
    
    #Speaker Narrator
    You sit next to Eira and the lady takes a seat on a chair in front of you.
    
    This is Eira, she is my assistant. She has been living with me for a month.
    
    #Speaker ???
    Pleased to meet you miss Eira.
    
    #Speaker Eira
    You too, miss...
    
    #Speaker Alaida
    Alaida, Alaida Quilvik.
    
    #Speaker Eira
    Pleased to meet you miss Alaida.
    
    #Speaker Alaida
    I am here to investigate the possible site in which a dragon fled. This might be the cause of this sudden weather shift you are experiencing here in Veliwood. Would you happen to know anything about that.
    
    #Speaker You
    I think we can get to an arrangement.
    
        It's useless to hide the obvious but, what could we do in order to spare that dragon.
        
    #Speaker Alaida
        You mean to tell me you want to spare that creature?
        
    #Speaker Alaida
        Why?
        
    #Speaker You
        Because the dragon doesn't want to fight. Miss Alaida, all she wants is to live a normal life. Help me help her.
        
    #Speaker Alaida
        You are out of your mind. *Points bow*. She would kill all of us without hesitation. Why shouldn't I do the same?
                
        { affection >= 5: -> defend | -> self_defense_ending }
        
        = defend
            * [*Stand between them*]
            
    #Speaker Narrator
            You get between Alaida and Eira and suddenly feel a sharp pain go through you. You fall to the ground and feel a warmth in your chest and drive your hand across it. You look at it and find it completely bloodied.
            
            -> bolt_death.death
            
                
            
            * Don't shoot!
                
                -> killed_ending
                
=== self_defense_ending ===

    #Speaker Narrator
    Eira sees the bow pointed at her and finally looses it. Her visage shifts to a more lizard-like form and she begins to grow in size until her gargantuan white figure collapses your house.
    
    #Speaker Narrator
    You are buried by the rubble. Your conciousness fades slowly and you find yourself witnessing a titanic battle between an experienced huner party and a white dragon as your last sight.

->END
=== killed_ending ===

    #Speaker You
    Please, wait!
    
    #Speaker Alaida
    I have no time for this.
    
    #Speaker Narrator
    The arrow releases from her bow and pierces Eira's chest, she falls in the couch.
    
    #Speaker Narrator
    You run to Eira and pick her up between your arms. She looks at you, with a soft smile of relief.
    
    #Speaker You
    Why didn't you defend yourself?! Y-you could have-
    
    #Speaker Eira
    Shh, it's okay. It's better this way. I don't want to live hiding anymore. *cough*
    
    #Speaker Eira
    Aah~ But this is better than I ever thought. I never imagined I would d-die *cough* between the arms of my beloved.
    
    #Speaker Eira
    It's just like if I was a princess. *sigh* Soooo dreamy...
    
    #Speaker Narrator
    And with that she was gone. Her conciousness left her body without you being able to even say goodbye. 
    
    #Speaker Narrator
    You fought Alaida in a blind rage and got yourself arrested. In your cell you thought time and time again on how you would make them pay, pay for all they took from her and from you. But that's a story for another time.
    
->END
=== betrayal_ending ===

    #Speaker Narrator
    You tell the party about Eira. They slowly sneak around the house, the elven lady throws some kind of bombs that feel the house with a bluish smoke to the brim in but a minute.
    
    #Speaker Narrator
    Eira comes out of the house hand in her mouth coughing heavily and looks at you. A stream of tears pours from her eyes as she clutches her chest.
    
    #Speaker Eira
    It wasn't your fault.
    
    Before you have time to say anything two bolts come flying right by you and pierce through Eira's body. Her limp body falls to the ground, unmoving.
    
    #Speaker Narrator
    The party rewards you with some gold and you are left in your house by yourself again. 
    
    #Speaker Narrator
    The dragon has been slain, but the guilt never washes away from your brain. In the end she just wanted to live peacefully and that thought along with the smile on her face as tears rolled down her cheecks, will haunt you forever.
    
    -> END
    
=== flee ===

    #Speaker Narrator
You get back into your house and close the door. In the living room you find Eira, trembling with fear in the couch. You sit next to her.

    #Speaker Narrator
She seems almost in shock. How could you confort her?

* { complaints.confession } [*Pat her head*]

    #Speaker Narrator
    You gently pat her head slowly until she seems to settle down.
    
    #Speaker Eira
    No one's ever done that to me before. It's nice for a change.
    
    ~ affection++
    
    -> continuation

* { complaints.confession } [*Caress her cheek*]

    #Speaker Narrator
    You softly place your hand in her face and tilt her head just enough for you to make eye contact.
    
    #Speaker You
    It's fine, nothing will happen to you. I won't let it.
    
    #Speaker Eira
    That feels nice. Thank you.
    
    ~ affection++
    
    -> continuation

* { complaints.confession } [*Hug her*]

    #Speaker Narrator
    You get closer to her and slowly pull her in for a tight embrace. { affection >= 5: She hugs you back and y|Y}ou feel her tense body ease up between your arms.
    
    #Speaker Eira
    I'm so tired... { affection >= 5: Do you mind if we stay like this for a little longer?<br><br> You nod and stay silently holding her for a few minutes, before she composes herself. | }
    
    ~ affection++
    
    -> continuation

* Keep it together, Eira.
    
    -> continuation

= continuation

    #Speaker Eira
I'm sorry about that. How did it go?

    #Speaker You
{ not complaints.confession: Why didn't you tell me you were not a humanoid? <br><br> I'm sorry I was scared you would leave me to my own devices. }

The way I see it we have two options. We can flee or we can stay and hope they don't catch on to us.

#Speaker Eira
That can't be... What do you think the best course of action is?

* We are fleeing.

    But we have to do this quickly. We will get caught otherwise.
    
    #Speaker Eira
    What do you suggest?
    
    #Speaker You
    In a few hours we will run towards the forest and try to hide there from them until they give up.
    
    #Speaker Eira
    But what if they don't give up?
    
    #Speaker You
    Then you can take us out of there flying. You are a dragon, are you not?
    
    #Speaker Eira
    You are right but...
    
    #Speaker You
    Trust me, this will go smoothly.
    
    -> flee_attempt
    
* We are staying.

    We can make them think you have nothing to do with this weather.
    
    #Speaker Eira
    Won't they be able to figure it out? They are professional hunters, they had me against the ropes when they fought me.
    
    #Speaker You
    Just leave the talking to me. I will figure something out, I promise.
    
    #Speaker Eira
    The next morning comes and you invite the elven lady into your house as agreed upon last night.
    
    -> home_talk
    

= flee_attempt

    #Speaker Narrator
    You wait until the arranged hour and get to the door. You step outside, but can see nothing through the veil of night. Eira follows you and the two of you begin to slowly make your way towards the forest.
    
    #Speaker Narrator
    The stillness of night is pierced by a whistle as you see a bolt approach you at fast speed.
    
    * [*Push Eira*] -> bolt_death
    
    * Eira, duck!
    
    -> run
    
=== run ===

    #Speaker Narrator
She quickly ducks and the bolt flies over her head. You take her hand help her up and continue running.

#Speaker Eira
Hold on tightly.

    #Speaker You
What?!

    #Speaker Narrator
A pair of white skin wings sprout from her back and she takes off flying into the sky carrying you. Bolts keep flying in your direction but none connect with you and both of you fly off into the horizon.

After flying for a long time you land on a mountain. After a few minutes the mountain gradually becomes shrouded by dark clouds. Both of you are safe, but for how long.

* [We are okay.] 

I'm okay, you're okay, we're okay.

    #Speaker Eira
Seems like it, yes. What will you do now? You have been brought into all of this mess because of me.

    ** I knew what I was getting myself into.
    
    ~ affection ++
    
    { affection >= 5: -> love | -> roamers }
    
    ** And I would do it again
    
    ~ affection ++
    
    { affection >= 5: -> love | -> roamers }

= love

    #Speaker Eira
I tried so hard...

    #Speaker You
What did you try?

    #Speaker Eira
I tried so hard not to fall in love with you, but you kept giving me a treatment no one has ever given a monster before. Before I knew it, I found myself caring deeply for you. And that feeling grew even stronger with time.

    #Speaker Eira
I love you, crazily so.

* I'm sorry.

    I wouldn't know how to love you, we are too different. I cannot say I don't feel anyhing for you, but this I feel is not the love a couple feels, but a platonic one.
    
    #Speaker Eira
    I... Undestand. I'm fine with just standing by as we are, as long as I can stay with you.
    
    -> roamers

* I love you too.

    #Speaker Eira
    What?! Are you serious?! But I'm a monster and-
    
        ** [*Kiss her*]
        
    #Speaker Narrator
            You fix your eyes into her lips, moving fast, making excuses out of fear of you loving her back. You feel the urge to make them stop and you move closer and closer until there is no space between hers and yours.
            
    #Speaker Narrator
            She tenses up out of surprise, but responds in kind to your advance. And for a while everything stops around the both of you.
            
    #Speaker Narrator
            You ease up and press your forehead against hers.
            
    #Speaker You
            Do you think I care what they say you are?
            
    #Speaker Narrator
            She smiles with a brightness you had never seen before coming from her and for the first time since you met Eira, you feel like she really means that smile.
    
            -> roamers
        
        ** You are not.
            
            Stop saying that. You are a normal woman who wants to live in peace. Who cares about your race, or would you say elves are not people? Or dwarves are not people? Or we humans? What makes you different?
            
    #Speaker Narrator
            She wraps her arms around you tightly and you embrace her back. For a moment time seems to stop around you and you feel like nothing really matters as long as you can be together.
    
            -> roamers

= roamers

    #Speaker Eira
Would you walk this path of continuous hiding and running away with me?

    #Speaker Narrator
Better to do it together than each by ourselves. Don't you think.

    #Speaker Narrator
Together now and forever, the couple of eternal winter marched into the horizon living a life of persecution. Their lives were chaotic and filled with aggression towards them, but happier nonetheless, now that they had each other to rely on.

-> END
=== bolt_death ===

    #Speaker Narrator
You quickly push Eira out of the way and feel a sharp pain go through you. You fall to the ground and feel a warmth in your chest and drive your hand across it. You look at it and find it completely bloodied.

    #???
I said no funny business, didn't I?

->death

= death

    #Speaker Narrator
Eira lifts your body between her arms and looks at you in abject horror.

    #Speaker You
You're crying... Shh, it's okay. You have to run now. Otherwise they w-will catch you.

    #Speaker Eira
Please, don't leave me. You gave me everything...

    #Speaker Narrator
She clutches your hand in hers, you can feel her cold skin. Her grip is really firm and tightens with every second.

* I love you.

    Gods, I wish I h-had *cough* said it sooner.
    
    #Speaker Eira
    What are you saying right now?! I'm a monster, I kill everything I come close to.
    
    #Speaker You
    You are not. Just listen, I d-don't have much *cough* time left.
    
    I *cough* want you to know that I-
    
    #Speaker Eira
    { affection >= 5: Her lips cut you mid-sentence as they meet with yours. You can feel her answer in the passion of the moment. | I can't love you back, I don't know how to. }
    
    #Speaker Eira
    You can't leave, I wouldn't know what to do...
    
    #Speaker You
    I'm *cough* s-sorry.
    
    #Speaker Narrator
    Your vision fades to black slowly but, you are not alone. You feel Eira's arms tighten around you body. The grip weakens and you see her figure transmogrify into a gargantuan white figure. Your eyes close one last time, but before leaving you hear one last thig. 
    
    #Speaker Eira
    { affection >=5: I will forever love you too. | It's okay, I'm here. }
    
    -> END
    
* Leave.

    You have suffered enough. You deserve a life of your own.
    
    #Speaker Eira
    No, please... Please...
    
    #Speaker Narrator
    Bolts pierce the air once again as your conciousness begins to fade. You feel Eira's tears impact against your skin the last thing you see is Eira's visage shift from teary sadness to murderous intent.
    
    #Speaker Narrator
    A white shadow towers over your body and you depart hearing a roar of anguish and sadness.
    
    -> END
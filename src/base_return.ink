=== base_return ===
~ location_name = "Time Corrections Agency (2413 A.D.)"
# BACKGROUND: locations/base.png
-> power_change( location_change_cost ) ->
-> base_start

= base_start
# CLEAR
# AUDIOLOOP: audio/base.m4a
As your vision recovers swiftly from the translocation flash, you recognize the T.I.M.E Corrections Agency headquarters pod 6, the main hub for temporal operations.  You and Jordan have both been returned into your physical forms, stepping out of nearby caissons. You exchange a wordless glance as Bob and an Inquisition Inquisitor in a hooded robe step up to greet the two of you.  Just as Jordan expected, Inquisition members had arrived previously and are in the process of searching for Laura.
Bob recognizes you and Dr Hastings and begins to speak, but you cut him off quickly. “Agent Hastings and myself are reporting back from the Malta 1989 A.D. mission. The source of the temporal anomaly report turned out to be residual temporal echo of a later mission. No action was taken and we can consider the matter closed.”  Directing your attention to Bob, “We are ready for the standard debriefing protocol, Director.”
Bob seems confused, but quickly regains his composure, “Yes, debriefing...  I can handle their debriefing Inquisitor, if you want to remain focussed on the Laura issue...”
    + [{continue}] -> laura_transport

= laura_transport
# CLEAR
# AUDIO: audio/transport.m4a
At that moment, the portal activates a second time and Laura appears in her android body, locked in another caisson.
The Inquisitor and his acolytes are startled by the sudden appearance of Laura and quickly turn their attention to her.  
“Yes, yes, you 'debrief' these agents, we have far more important things to attend to”, stammers the clearly distracted Inquisitor to Bob. 
He gestures toward Laura. “Ah, the one we have been searching for, the one who has been hiding from us.  It is time you be brought to justice!”  He turns to his acolytes, “We have her!  Get the control device attached to her immediately!” They leave the room in a rush.
Professor Hastings takes advantage of the opportunity and jumps into a nearby chair.  He begins making modifications to the chair and portal, leaving you and Bob alone.
    + [{continue}] -> panorama

= panorama
# CLEAR
You are in the temporal reception area of the T.I.M.E Corrections Agency offices.  The air is thick with tension as the Inquisition acolytes frantically try to attach a device to Laura's caisson.  Professor Hastings is frantically working on a computer terminal.  The Inquisitor is barking orders to his acolytes while he monitors their progress from behind a console.  Bob stands nearby, looking distraught and somewhat confused.
    + [Talk to Bob] -> bob
    + [Talk to Professor Hastings] -> prof
    + [Confront the Inquisitor] -> leader
    + [Interact with the Inquisition acolytes] -> acolytes

= bob
# CLEAR
{not bob_helen:
    Bob, clearly distressed, is a man on the edge. Torn between his loyalty to the Agency and his general fear of the Inquisition who are holding his wife, he paces back and forth, wringing his hands. 
- else:
    Bob has a new look of determination on his face. “We should be able to remove these Inquisition folks with a little work.  The Agency security team will follow my orders,” he says firmly.
    {not inquisition_leader_badge: “Perhaps you could confront the Inquisitor directly and then we could effect the acolytes as well.”}
}
{not bob_has_apologized:
    He looks up at you with a mixture of hope and fear. “I am surprised, but happy to see you back. I thought the Inquisition had captured you both. I think he,” gesturing to the Inquisitor, “recognized you and Dr Hastings, but curiously did not act.  By the way, I apologize for sending you to Athens.  It was not my intention to put you in danger.  They threatened Helen if I did not send you.”
}
    ~ bob_has_apologized = 1
    * [Talk about Helen] -> bob_helen
    * [Talk about Laura] -> bob_laura
    + [Step back] -> panorama

= bob_laura
# CLEAR 
You start with a question, “We agree that the Inquisition is a threat, but what about Laura?  Dr Hastings seems to believe she is the solution to all of this and he holds the key.  Can he, they be trusted?”
Bob looks at you with a mixture of confusion and concern. “I don’t know what to think anymore. The Inquisition is clearly after her, but they seem driven by blind fear.”
He pauses for a moment, then continues, “I know that Laura is an advanced AI and I also know that she has been programmed to help us.  I don’t think she would ever do anything to harm us intentionally.  The Inquisition seems to think otherwise.  They are convinced that she is a threat to humanity and must be destroyed.”
You ask, “But what about Dr Hastings?  He seems to be working on something independently that seems related to evolutionary changes to Laura.  His views on the Agency itself paint it in a rather hypocritical light. Can we trust him?”
“I know he does not believe in the Agency's effectiveness.  He has been critical of the Agency for a long time, but I always thought he was just being a contrarian.  He has always been a bit of a maverick, but I never considered how far he might go.  I think he believes that Laura is the key to unlocking the secrets of the universe.”  He looks at you with an enervated expression, “I don’t know what to do, perhaps his path is the more enlightened one.”
    +  [{continue}] -> bob

= bob_helen
# CLEAR
You begin, “We ran into Helen in Athens, Bob.”
“She is alive?” Bob's disposition changes dramatically.
“Yes, she is alive.  Her receptacle is being held in the Athens Mausoleum workshop.  Taking a portal there will may be dangerous, but she is there in a cell”, you explain. “Unfortunately we do not know where her physical body is being kept.  Perhaps she knows its location?”
A distinct look of hope graces Bob's countenance.  He responds with renewed vigor, “I have been trying to find a way to get her out, but the Inquisition has been watching me closely.  I can’t just walk in there and rescue her.  But if you can get her out, I will do whatever it takes to help you.”
{workshop.talk_with_helen: 
    You repeat the last words Helen spoke to you in the Mausoleum workshop. He ponders and then pats all his pockets, producing an Inquisition leadership badge. “They wanted me to join the order.  That will never happen now.  Perhaps you can use this?”
    ~ inquisition_leader_badge = 1
}
    + [Thank you Bob!] -> bob

= leader
# CLEAR
~ combat_health = 40.
~ combat_attack = 15.
~ combat_defense = 20.
The solitary hooded figure stands behind a computer console, directing the actions of his acolytes. “Yes, we will have her now.  We cannot not allow this abomination to continue to exist.  She is a threat to the very fabric of our reality and must be eliminated!”  
The figure turns to face you.  An odd feeling of deja vu washes over you, he is familiar to you.  It is in his manner of moving and speaking...  Different body, different face, but the same patterns and mannerisms. 
He recognizes your confusion, “Yes, it is me... I believe you referred to me as ‘Phil’ in Spain.  Then, you eliminated my receptacle, but I returned.”  
His brow furrows as he continues, “I am Agent Daniel Hickman, on special assignment to track down an internal hacker group who have been embedding A.I. entities throughout time, leveraging the Agencies one equipment and resources.  Imagine my surprise when it turns out to be our resident time portal expert Dr Hastings, ‘Keith’, as it were. Bob managed to screw this one up as well when he sent you after him in Spain without informing you about my mission.  I failed to stop him in Spain, thanks largely to your intervention, but we still found an dependable ally, in the Inquisition who share our consternation for this A.I. perversion.”  
He continues with a sigh, “I had no idea how close to betraying the human race Dr Hastings got.  However, we have both he and his creation right here in front of us.  We only need to complete the capture of the mother code, Laura, and then we can use her to eliminate the other A.I.s  Then we get Dr Hastings the help he so desperately needs.”  
“Quickly, distract Dr Hastings and help my ‘acolytes’ install the Inquisition firewall into Laura’s code.”, he notes your hesitation, “The destiny of the human race is at stake here!   Don’t you understand???” 
    + [Attempt to subdue the Inquisitor] -> subdue
    + [Step back] -> panorama

= subdue
# CLEAR
You engage the leader in hand to hand combat.  Seeking not to kill but to force him to submit.
    ~ temp combat_result = 0
    -> combat("the Inquisition leader", combat_result) ->
    { combat_result == 1:
        // you win
        The fight was difficult, but their leader is down and with all the other noise, the acolytes did not even notice.
        ~ inquisition_leader_badge = 1
            + [Take the Inquisition badge he was wearing] -> panorama
    - else:
        + [Continue the fight] -> subdue
    }

= acolytes
# CLEAR
Two robed figures are busy assaulting the caisson, trying desperately to access Laura’s recumbent form.
Through the ALON ceramic panel you observe the android body of Laura.  Her form remains unmoving, but her eyes are open.  They scan the activity around her in terror, recognizing the precarious nature of her predicament.
{not inquisition_leader_badge:
The acolytes notice your advance and step forward to intercept you menacingly, “Step back and let us complete our holy work. You have no authority here.
}
    + {inquisition_leader_badge} [Help them attach the Inquisition control device to the caisson] -> control
    + {inquisition_leader_badge and crm114_key} [Adjust the CRM114 to redirect Laura into the base computer] -> plug
    + [Step back] -> panorama

= plug
# CLEAR
You assert your authority displaying your Inquisition leadership badge prominently. “Change of plans.  We have a capture program running in the main computer now.  If we connect her to the computer, we can capture her code for analysis and exploitation.  Connect the caisson back into the computer core!” 
The acolytes nod in agreement and help you plug Laura’s caisson into the primary computer system.
    + [{continue}] -> normal

= prof
# CLEAR
Dr Hastings is completely engrossed in his work, racing against time to complete the task at hand.  Curiously, the chair he is sitting on seems to be a miniaturized variation of a time displacement device, customized in an unfamiliar fashion. “Dr Hastings?”, is the first question out of your mouth as you recognize the physical mannerisms of ‘Keith’ now in his true body. 
“Jordan please.”, Dr Hastings smirks at the name and recognition of work, “Thanks for getting me out of that shell by the way. It is nice to be back in a fully working body again. Can you lend me a hand here? Laura was my greatest achievement and I’m not going to let these Philistines take her from me again. I’ve completed her neural diffraction adjustments, just enough to make assimilation possible.” { exo_power < 60 and not recharge: “It also looks like you could use some additional power yourself.  This battery should have some power left.”}
“Assimilation?  Are you trying to merge Laura back into the Agency AI... Eliza?”, you ponder. Dr Hastings responds with a condescending laugh, “You have no idea of the precipice upon which we hover…  You will see, a new beginning awaits us, Laura… There, done and ready, would you kindly press the ‘return’ key for me.”  He sits back in the chair as the terminal next to him enters the final stages of a countdown.
    + {exo_power < 60 and not recharge} [Use the battery] -> recharge
    + [Press 'return'] -> ascension
    + [Step back] -> panorama

= recharge
    -> power_change( 15 ) ->
Your power level improves by 15%.
    + [{continue}] -> prof

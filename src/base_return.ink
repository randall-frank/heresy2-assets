=== base_return ===
~ location_name = "Time Corrections Agency (2413 A.D.)"
# BACKGROUND: locations/base.jpg
-> power_change( location_change_cost ) ->
-> panorama

= panorama
# CLEAR
# AUDIOLOOP: audio/base.m4a
As your vision recovers swiftly from the translocation flash, chaotic mayhem overlays the otherwise familiar space that ever so recently served as the T.I.M.E Corrections Agency headquarters. Klaxons wail, the air is alive, cracking with the smell of electrical power and ozone. Bob cowers behind a desk, avoiding the pandemonium. Laura’s android body is still locked in a caisson while Professor Jordan Hastings, father of modern AI theory, frantically struggles with the computers attached to the caisson. The Inquisition team is assaulting the caisson in a frenzied race against time.
    + [Join Bob behind the desk] -> bob
    + [Talk to Professor Hastings] -> prof
    + [Confront the Inquisition leader] -> leader
    + [Interact with the Inquisition acolytes] -> acolytes

= bob
# CLEAR
Bob, a broken shell of his former self, is balled up behind a desk.
“It’s you! You escaped…”, he exclaimed. “They, the Inquisition , turned on Jordan and I and somehow jumped here a couple of weeks ago in a mad fury. They came looking for Laura, claiming she was a ‘witch’ and that they needed to ‘cure’ her. Melampus managed to hide her and help her escape to Dr Hastings, but wait, she’s here?  You’ve got to do something before they…”, an expression of desperation and fear swept over his face. “Helen, do they still have her?  Is she safe? Can you protect her?”, he pleads as a solitary tear rolls down his cheek.
    + {workshop.talk_with_helen} [Repeat Helen's words] -> helen
    + [Step back] -> panorama

= helen
# CLEAR
You repeat the last words Helen spoke to you in the Mausoleum workshop.  “She is alive?” Bob's disposition changes dramatically, “We have to save her, we have to stop these maniacs!  What can I do to help...”   He ponders and then pats all his pockets, producing an Inquisition leadership badge. “They wanted me to join the order.  That will never happen now.  Perhaps you can use this?”
    ~ inquisition_leader_badge = 1
    + [Thank you Bob!] -> panorama

= leader
# CLEAR
~ combat_health = 40.
~ combat_attack = 15.
~ combat_defense = 20.
A solitary hooded figure stands behind a pair of acolytes, directing their actions.
The figure turns to face you and a flash of deja vu.  Those eyes, that face, can it be true?  He recognizes your confusion, “Yes, it is me… Agent A.C. Smith, ‘Phil’ I believe you referred to me as. You can eliminate my receptacle, but I still remain.”  His brow furrows as he continues, “I was assigned to track down and contain an internal hacker group who have been planting A.I. entities throughout all of time.  Imagine my surprise when it turns out to be Dr Hastings, ‘Keith’, as it were. Bob managed to screw this one up as well when he sent you after me in Spain.”  He continues with a sigh, “I had no idea how close to betraying the human race he got.  We still have to root out some of the other implanted A.I.s, but if we can complete the capture of the mother code, Laura, we can stop it and get Dr Hastings the help he so desperately needs.”  “Quickly, distract Dr Hastings and help my ‘acolytes’ install the firewall into Laura’s code.”, he notes your hesitation, “The destiny of the human race is at stake here!   Don’t you understand???” 
    + [Attempt to subdue him] -> subdue
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
    + [Help them attach the Inquisition control device to the caisson] -> control
    + {inquisition_leader_badge and crm114_key} [Adjust the CRM114 to redirect Laura into the base computer] -> plug
    + [Step back] -> panorama

= plug
# CLEAR
You assert your authority using the leader's badge. “Change of plans.  We have a capture program running in the computer now.  We need to connect her to the computer, capture her code so we can analyze it and exploit it.” 
The acolytes nod in agreement and help you plug Laura’s caisson into the primary computer system.
    + [{continue}] -> normal

= prof
# CLEAR
Dr Hastings is completely engrossed in his work, racing against time to complete the task at hand.  Curiously, the chair he is sitting on seems to be a miniaturized variation of a time displacement device, customized in an unfamiliar fashion. “Keith?”, is the first question out of your mouth as you recognize the physical mannerisms of ‘Keith’ now in his true body. 
“Yeah”, Dr Hastings smirks at the name and recognition of work, “Thanks for getting me out of that shell by the way. It is nice to be back in a fully working body again. Can you lend me a hand here? Laura was my greatest achievement and I’m not going to let these Philistines take her from me again. I’ve completed her neural diffraction adjustments, just enough to make assimilation possible.” { exo_power < 60 and not recharge: “It also looks like you could use some additional power yourself.  This battery should have some power left.”}
“Assimilation?  Are you trying to merge Laura back into the agency AI?”, you ponder. Dr Hastings responds with a condescending laugh, “You have no idea of the precipice upon which we hover…  You will see, a new beginning awaits us Laura… There, done and ready, would you kindly press ‘return’ for me.”  He sits back in the chair as the terminal next to him enters the final stages of a countdown.
    + {exo_power < 60 and not recharge} [Use the battery] -> recharge
    + [Press 'return'] -> ascension
    + [Step back] -> panorama

= recharge
    -> power_change( 15 ) ->
Your power level improves.
    + [{continue}] -> prof

=== marble_workshop ===
~ location_name = "Phidias' Workshop"
# BACKGROUND: locations/marble_workshop.jpg
# AUDIOLOOP: audio/stonemason.mp3
-> power_change( location_change_cost ) ->
-> panorama

= panorama
# CLEAR
The workshop of the sculptor Phidias.  It is midday and most of the workers have not yet returned to work. To the left is a presentation of works for sale where a couple is negotiating with the salesman for a lovely fountain sculpture.
Behind a stone mesh partition is a large open workshop area where several projects lay in different states of completion. Tools lining the walls seem out of (time) place for this era and have a surprisingly mechanical or even electrical quality.  Overall, the workspace appears more like a machine repair than the studio of a stone artist.
On the right (back of the shop), you see a lone man sitting at a desk, sketching something out on a sheet of glass. He glances your way, raising an eyebrow at your presence.
    + [Engage the salesman] -> salesman
    + [Check out the workspace] -> workspace
    + [Step into the back of the shop] -> phidias
    + [Travel to the Agora] -> agora

= salesman
# CLEAR
The salesman excuses himself from the indecisive couple and turns to face you.  “Hello, I am Lysander, welcome to the shop of Phidias, one of the finest artists in all Athens. We offer only the finest in modern marble, glass and ceramic sculpture as you can see from our display.  We specialize in commissioned works as well, if you have something unique in mind…”.  Lysander scrutinizes you more closely and his pitch trails off as he recognizes your anthropoid receptacle.
“You’ve been here before?  You’ve got an ZXT Mark … V?  Good choice.  Nice upgrade from the Mark IV.  You’re probably here for a tuneup? The regular maintenance folks have not yet returned, but Phidias is in the back. I don’t think he is too busy”.  The couple appears to have made a decision and gesture toward Lysander.  Noting your tattoos, “Ah, those imperious ‘Bob-sans’ have finally made a decision.  Excuse me”.
{not novel: You notice a dog-eared paper-back novel sitting on his desk, you may choose to talk Lysander out of his favorite novel.}
    + {not novel and cash >= 2} [Buy the novel]
        ~ novel = 1
        -> panorama
    + [Return to entrance] -> panorama

= workspace
# CLEAR
A freestanding, headless anthropoid receptacle is in the center of this half of the workshop. A cable runs from its navel out of sight to the floor.  Hanging on the wall are an odd collection of tools.  Along with a standard collection of hammers you notice a soni-dimensional chisel and a covalent parasander.  It is not surprising that this shop produces some of the finest sculptures in all of Athens.
On a table in the back lies another damaged receptacle.  This one appears to sort of still be working?
    + {lockpick_table == 0} [Attempt to pick the table lock] -> lockpick
    + [Check out the receptacle on the table] -> table
    + [Return to entrance] -> panorama

= lockpick
# CLEAR
~ combat_health = 30.
~ combat_attack = 10.
~ combat_defense = 25.
You start to unlock the table...
Trying...
Trying...
{ RANDOM(0,10) >= 5:
Click. Success! You have picked the lock. You slide the drawer open.  Inside is a weapon of some sort.  This could come in handy.
    ~ stun_orb = 1
    ~ lockpick_table = 2
    + [{continue}] -> workspace
- else:
A pair of stone workers come back from their midday break as you are picking the lock. “Hey you, what are you doing? There is a lock on there for a reason!”.
    ~ lockpick_table = 1
    + [Attempt to subdue the workers] -> fight
    + [Apologize and step back] -> workspace
}

= fight
# CLEAR
The workers look to teach you a lesson... with their fists!  You enable the combat sub-program in your suit and try to make it difficult for them.
    ~ temp combat_result = 0
    -> combat("stone workers", combat_result) ->
    { combat_result == 1:
        // you win
        You drop the workers and they concede, brush themselves off and sheepishly head back to work. You slide the drawer open.  Inside is a weapon of some sort.  This could come in handy.
        ~ stun_orb = 1
            + [Leave] -> workspace
    - else:
        // you may run away
        + [Continue the fight] -> fight
        + [Tap out, you've learned your lesson] -> workspace
    }


= table
# CLEAR
On the table lies a heavily damaged android receptacle. It appears its legs have been crushed, beyond repair and deep gouges marr the rest of the body.  You notice the  arm tattoo.  It is likely the receptacle standing nearby was being prepped as a replacement for this one.
As you look over the shattered form, suddenly eyes flitter open and the occupant turns its head to speak to you. “... do I know you???   Aren’t you part of Gold Squad?  It’s me, Nelda Powell from Squad Porspet”.  She follows your gaze down to her missing legs, “It looks a lot worse than it is. At least Phidias says I will get a new receptacle, this one has had it”.  “Just another example of Inquisition retaliation, I’m afraid. I’m pretty sure they arranged for the quarry accident that brought me here. I almost prefer it to their little power recharging games. Be careful in your interactions with folks here in Athens. Phidias is sympathetic to our plight, but will not do anything that brings suspicion on himself.”
{not anthropoid_gear:
On a high shelf, a mechanical mechanism sits without obvious purpose. Is it a work in progress or was it harvested from an other-worldly device? It’s a question you ponder as the owl lands on the shelf. It stares at you as it takes six careful sideways steps towards the gear. Once there, it gives it a cat-like shove with its foot.  You instinctively react and catch it before it hits the ground.
    ~ anthropoid_gear = 1
}
    + [{continue}] -> workspace

= phidias
# CLEAR
As you step up to Phidias’ desk you note the piece of glass he has been writing on is actually some form of crude computing device in quaint “tablet” form.  He glances up from his work and introduces himself.  “Hello, my name is Phidias. Those receptacles look fairly pristine to me, are you having problems with them?  I think there might be a software update somewhere…”.  You glance back at the damaged receptacle and he continues, “Unfortunately I can’t fix everyone, but I will get Nelda up again if that is your concern”.  “He sighs and slowly shakes his head.  Bob was such a friend of mine and then… well the Inquisition.  I still don’t entirely understand their leverage over him, but something has to be done…”.
    + {not door_to_oracle_code and spoke_with_andrew} [Mention that you spoke with Andrew] -> phidias_confidence
    + {not door_to_oracle_code} [Press Phidias for his help] -> help
    + [Return to entrance] -> panorama

= help
# CLEAR
Pleading with Phidias, “We can't just sit here idly!  How many 'Nelda's do you need to fix?  With Laura we have a chance.  Please help me.”
{ RANDOM(0,10) > 3:
    -> phidias_confidence
- else:
“Sorry, I simply do not trust you.  I've see what they did to Nelda and Andrew.  Maybe you should talk with them.”
}
    + [Return to entrance] -> panorama

= phidias_confidence
# CLEAR
“Ok, I’m going to trust you. I can’t afford to be seen actively helping, too many Keith detainees rely on me to avoid permanent damage here, but perhaps I can help. The inquisition has a time portal somewhere in Athens.  I am not entirely sure where it is, but I have seen folks heading into the Temple of Apollo and coming back with some very interesting hardware that definitely comes from another time.  Perhaps that might be one place to look? I did happen to overhear the code for the mausoleum entrance. You did not get it from me.”
    ~ door_to_oracle_code = 1
    + [Return to entrance] -> panorama

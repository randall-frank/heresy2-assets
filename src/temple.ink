=== temple ===
~ location_name = "Temple of Hephaestus"
# BACKGROUND: locations/temple.jpg
# SBIMAGE: items/temple.png
# AUDIOLOOP: audio/temple.mp3
-> power_change( location_change_cost ) ->
-> panorama

= panorama
# CLEAR
The Temple of Hephaestus towers before you, a breathing forge of industry that fires the island. Around the edges of the temple artisans and potters ply their trade, throwing clay and molding into beautiful ceramics and artistic works of metal. They honor the god, pouring themselves into their work. Carefully crafted colonnades hold the roof aloft while priests and adherents work their rites within.
The outer temple columns serve as both workplace and home for the lost and discarded. Beggars ply their arts for alms while an individual, not of sound mind or soul, wanders by, endlessly muttering to themselves and anyone willing to lend an ear.
One can almost make out the large statue gracing the pornaos.
{not intervene:
    The Cella is filled with small groups of people having conversions and milling about.
}
Deep in the interior of the temple is the opisthodomos flanked by wary acolytes.  Next to the acolytes is a heavy metal door with a digital keypad.

    + [Interact with the beggar] -> beggar
    + [Enter the temple pronaos] -> pronaos
    + {not intervene} [Walk the cella] -> cella
    + {not melampus_key} [Approach the opisthodomos] -> opisthodomos
    + {not melampus} [Examine the keypad] -> keypad
    + {melampus} [Visit Melampus via the locked door] -> melampus
    + {melampus_list} [Travel to the Agora] -> agora
    + [Travel to the Private Garden] -> garden

= beggar
# CLEAR
A beggar in rags kneels by a rough, unbaked bowl. The craftspeople avoid even looking at him as they go about their day. As you approach, he lifts his head and an all too familiar symbol appears.
“Yeah, I worked for Bob. So what? Came all the way back to serve, to build a portal…”
{ helped_beggar:
    "It is you again...  See, I remember!" followed by a befouled coughing fit.
- else:
    The beggar sees the tattoo on your shoulder and barks out a laugh that turns to a phlegmy cough. “So you’re one of them, eh? It was helping your kind that got me ruined. Maybe you could take pity on me and throw some wine or silver my way?”
        + {cash} [Give him a coin] -> donate
}
    + [{continue}] -> panorama

= donate
He blinks his unbelieving eyes... "Thank you kind sir, take this.  It may help you more than I. I will remember you."  He tears off a swatch of (modern) cloth from his rags.  It bears the logo of the Time Corrections Agency.
    -> cash_change(-1) ->
    ~ helped_beggar = 1
    + [{continue}] -> panorama

= pronaos
# CLEAR
# SBIMAGE: locations/hephaestus.jpg
As you move into the darkness of the temple, the heat and smell of furnace fires grows stronger. A statue of Hephaestus protects the entrance. He sits atop an anvil, holding his hammer, and staring at those who enter as though they are merely metal to work in his forge.
{not crutch:
    Leaning against the side of the statue is a crutch. Perhaps it was left by a wounded man who was helped inside or perhaps it was left by a beggar while they went and got lunch. But whoever owns it now, it’s clear that the rough and worn crutch once helped a wounded man move.
    The owl swoops between the columns and perches atop it, lets out one long whistle, then hops atop Hephaestus while the crutch falls to the floor.
    + [Collect the crutch] ->
        ~ crutch = 1
        -> pronaos
}
    + [{continue}] -> panorama

= cella
# CLEAR
~ combat_health = 10.
~ combat_attack = 2.
~ combat_defence = 50.
A crowd of people are milling about the center of the space, their attention on two men sneering and snapping at each other like sharp-toothed dogs. A man with a lame leg and a tattoo matching yours on his shoulder spits and screams and a man with smooth, unburnt skin and cold eyes that do not belong here.
Jeers of anticipation fill the air like smoke like fire from a forge. Nothing like a good fight to clear the air.
The lame man screams at his opponent, “You think you can come here like some tourist? To take what you want while we toil day and night?” He shakes his fist. “You tell that bastard Bob to come here himself. You tell him to come and I’ll tell him to…” The crowd howls as the man with cold eyes throws a right hook and the dispute is lost beneath the waves of cheers.
    + [Attempt to intervene] -> intervene
    + [Leave] -> panorama

= intervene
You step between the men and inadvertently get pulled into the fight.  The cold eyed man pulls a short pike from a hidden pocket.  He points it at you and the injured man and "fire" leaps out to hit the two of you.
You return the gesture with a closed fist.
    ~ temp combat_result = 0
    -> combat("a cold eyed man", combat_result) ->
    { combat_result == 1:
        // you win
        The cold eyes roll upward and the "man" freezes, stone cold like a rock.  No motion, no response at all.  The tattooed man mouths a silent thank-you and gets lost in the crowd.
        ~ won_cella_fight = 1
            + [Leave] -> panorama
    - else:
        // you may run away
        + [Continue the fight] -> intervene
        + [Disengage and blend into the crowd] -> panorama
    }

= opisthodomos
# CLEAR
In an alcove, a woman stands bathed in torchlight, pointing to a piece of parchment, and talking to a group of soot-covered men. They nod their heads as a problem long in their minds, finally unknots. She runs her finger from the top to the bottom of a complex design. “If we cut the current here and reroute, the amount of cross-talk should be reduced enough that we can finally…” She detects your approach.
“What do you want?” she says. “We’re in the middle of something important and we’re next to meet with Melampus. If you want to cut in line you’re going to need a good reason.”
    + {helped_beggar} [Show the cloth swatch from the beggar] -> enter_via_beggar
    * [Point out circuit flaws] -> enter_via_intelligence
    + [Leave] -> panorama

= enter_via_intelligence
// One time option
You saw enough of the diagram to know her design has enormous potential. But it has its flaws too. You point out a few ways of boosting power in the relays, while ensuring the diodes don’t blow out during a surge.
{ RANDOM(0,2) > 0:
    She blinks, unsure whether what you’re saying is useful nonsense or regular nonsense. That makes two of you. She hands you a piece of paper and tells you to go ahead. She needs time to think over what you’ve said.
    ~ melampus_key = 1
- else:
    “That has to be…” She starts. “No. It certainly is the dumbest thing I’ve heard in a year. Go learn something and come back when you can help.” She turns her back to you and continues talking about her design.
}
    + [{continue}] -> panorama

= enter_via_beggar
The men go quiet and the woman holds it in her hands before giving it back to you. “He was the best of us, and now…” She tenses. “Now he can barely hold his begging bowl. Go ahead. We can wait a while longer.” She passes you a piece of paper with a code, then resumes her discussions.
    ~ melampus_key = 1
    + [{continue}] -> panorama

= keypad
# CLEAR
A steel rimmed keypad sits next to a heavy door flanked with flickering torches. On either side of the door, a pair of stone guard dogs keep an eternal watch. You can hardly hear the talk of smiths, and the shouts of the crowd nearby. The ringing of hammers on anvils and the sound of quenched fire nearly deafen you. There’s too much noise from the hammering. Eager to get away from it, you enter the code on the keypad..
~ combo_value = 0
# COMBO
    + [Try the combination]
        { combo_value == 1337:
            "Access granted." The door swings open noiselessly and as you step through it swings shut. In here there is only the sound of one hammer…
            + [{continue}] -> melampus
        - else:
            "Bzzt! Invalid access attempt logged."
            + [Try again] -> keypad
        }
    + [Leave] -> panorama

= melampus
# CLEAR
# SBIMAGE: locations/melampus.png
You round a corner and find a man hunched over a bench, working with a delicate piece of circuitry. A jeweler's loupe is fastened to one eye. In the corner an automated machine hammers a piece of metal, shaping it into things yet to come. High above among the columns, mechanical planets orbit a perfect sun.
{ not melampus_list:
The owl flies to the other side of his bench and whistles. The man looks up and smiles. “Laura. You’re right of course..” The owl’s head spins and its wings flap enthusiastically. He laughs. “It worked! The plan worked.”
He turns to you but doesn’t rise from his seat. “So you’re the one Laura chose. That’s a heavy burden, but I learned long ago not to doubt her.” He looks at the owl. “Even when I was told to imprison her.” He snorts.
“But the time has come to set her free from this… this… what other word is there than madness?” He waves his arms around the room. “Bring me these items and we can restore her to where she belongs.” Melampus throws a scroll at you and returns to his work.
    ~ melampus_list = 1
- else:
    { check_melampus_list():
        "Excellent!  I've already started on the item you need."  He disappears behind a workbench, returning with a USB key.  "Here it is!  You need only plug this into Laura... the owl via a reasonably powerful computer.  Good luck!"
        ~ antivirus = 1
    - else:
        Exasperated, "You don't seem to have all of the list items yet.  I can't help Laura without all those parts."
    }
}
    + [Leave] -> panorama



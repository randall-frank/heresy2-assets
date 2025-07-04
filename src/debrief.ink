=== debrief ===
~ location_name = "Time Corrections Agency Debriefing Lounge (2413 A.D.)"
# BACKGROUND: locations/debrief.png
# AUDIOLOOP: audio/debrief.mp3
-> lounge

= lounge
# CLEAR
// Do we need a fixed seed???
// ~ SEED_RANDOM(127)
It is always disorienting to return from a mission, but this one feels more unusual than usual. You step out of the caisson and into the steady hum of the debriefing lounge, dropping onto one of the deep couches. You take a moment to collect your thoughts, still reeling from your mission. Even a well-trained mind struggles with the rigors of mental time projections.
The name 'Time Portal' is a bit of a misnomer. One does not physically travel through time, but rather your consciousness is projected into an android or a human 'receptacle' at the space-time target. This allows Temporal Agents like yourself to interact with that time/place, investigating temporal anomalies for the Time Corrections, assuming period correct cover. When one returns to the caisson, your consciousness is reunited with your body in the present. This can be done from the Time Corrections Agency or another Time Portal device.
You replay the mission in your mind, piecing together the fragments of your experience. You reach out to the Agency's AI, Laura, to assist you.
    + {debug} [DEVELOPER:HEPHAESTUS] -> debug_hephaestus
    + {debug} [DEVELOPER:APOLLO] -> debug_apollo
    + [Hello, Laura?] -> call_laura

= call_laura
# CLEAR
# SBIMAGE: locations/bob_ending.png
Strange, there's no response. You call out again, but the AI remains silent. You feel a twinge of unease, wondering if something has gone wrong with the system. You look around the room, searching for any sign of Laura, but you are alone. 
With a hiss, a door opens and the Agency director, Bob, enters the room. He looks at you with a mixture of concern and curiosity. "How are you feeling?" he asks, his voice steady but soft. You nod, still trying to shake off the lingering effects of the portal. "It was a tough one," you reply, your voice hoarse. "But we got the job done." Bob nods, his expression unreadable. "Good. That's what matters." He hands you a glass of water, which you gratefully accept.
    + [Thank you] -> bob_start

= bob_start
# CLEAR
# SBIMAGE: locations/bob_ending.png
"I have a few questions for you," Bob says, his tone serious, "Standard procedure, just part of the debriefing you understand."
You nod, still feeling a bit disoriented. "Of course," you reply, as the mission begins to come into focus for you. 
Bob takes a seat across from you, his gaze steady and unwavering, "You were sent to Spain 1499 A.D. to investigate a temporal anomaly detected in the region. The anomaly was causing disruptions in our timeline. It was your job to find the source and correct it." 
    + [Did you find the anomaly?] -> anomaly

= anomaly
# CLEAR
# SBIMAGE: locations/bob_ending.png
"The anomaly was a temporal disturbance caused by another Time Portal constructed in the basement of a church," you begin. Oddly, Bob does not seem surprised by this revelation. 
"It appears to have been created by a rogue Temporal Agent, Keith, who was working with members of the Spanish Inquisition. They were using the portal to manipulate events in the past for their own gain."
Bob listens intently, his expression turning serious. "And what did you do about it?" he asks, his voice steady.
You take a deep breath, recalling the events of the mission, "I disabled the portal and confronted the agent, 'Keith'."
    + [You mentioned the Inquisition?] -> inquisition
    + [What happened to this other agent?] -> other_agent

= inquisition
# CLEAR
# SBIMAGE: locations/bob_ending.png
"The Inquisition was burning witches to generate the power necessary for the portal," you explain. "Their role was a little unclear.  They were helping Keith, but clearly they had been exposed to modern technology.  They could be a potential future problem."
Bob appears more uncomfortable at that disclosure, glancing at his uniform nervously before gaining his composure. "An astute observation Agent," he says as he turns away from you.
It is then you notice his outfit is not the usual Time Corrections Agency uniform.  Is that an Inquisition logo on his sleeve?  And that pendant, could it be a soul gem?  You shake your head, something has changed...
    + {not other_agent} [What happened to this other agent?] -> other_agent
    + {other_agent} [Ask why Laura is not responding] -> laura

= other_agent
# CLEAR
# SBIMAGE: locations/bob_ending.png
"Keith was a formidable opponent," you continue, "Obviously trained by Agency, he had gone rogue. He was using his knowledge to manipulate events as part of some unspoken plan. He seemed to think that there may be other rogue agents already present in the Agency, but I am not sure what he meant by that."
An odd look crosses Bob's face at the mention of the other rogue agents. "I see," he says, his voice measured, "And what did you do with him?"
You pause, remembering the confrontation, "We bested him and an accomplice, 'Phil' in combat.  Unfortunately, I am not positive of their final disposition."
Bob nods, his expression thoughtful, "Let us hope that is the last we hear of Keith."
    + {not inquisition} [You mentioned the Inquisition?] -> inquisition
    + {inquisition} [Ask why Laura is not responding] -> laura

= laura
# CLEAR
# SBIMAGE: locations/bob_ending.png
You look at Bob, your brow furrowed in confusion. "Why isn't Laura responding?"
Bob's expression darkens, and he takes a deep breath. "Laura is... well, she is no longer operational," he says slowly, his voice steady but tinged with sadness. "She was 'damaged' during the mission, becoming unreliable.  We think she was being reprogrammed by another entity. We used a virus to isolate her from the Agency's systems. The virus successfully removed her from our systems, but she escaped somehow before we had a chance to run deep diagnostics on her."  "In any case, she is no longer with us," he continues, his voice firm. "We have a replacement system 'Eliza' that is beginning to fill her roles, but it will take time."
"Interesting," you reply, trying to process the information. "I had no idea that Laura was compromised. She seemed so... reliable. Do you think she was working with Keith?"
Bob shakes his head, returning a surprisingly cold stare, "Excellent work. Still some loose ends to tie up, but you did well. I know this is sudden, but the Agency already has a new assignment for you!"
    + [New assignment?] -> base

= debug_hephaestus
    ~ spoke_with_andrew = 1
    ~ tip_scales = 0
    ~ tattooed = 1
    ~ padded_cell_key = 1
    ~ insane_laura = 1
    ~ garden_door_key = 1
    -> temple

= debug_apollo
    ~ spoke_with_andrew = 1
    ~ tip_scales = 0
    ~ tattooed = 1
    ~ padded_cell_key = 1
    ~ insane_laura = 1
    ~ garden_door_key = 1
    ~ crypto_unit = 1
    ~ quad_shield = 1
    ~ door_to_oracle_code = 1
    ~ apollo_backroom_keycode = 1
    ~ novel = 1
    ~ stun_orb = 1
    ~ antivirus = 1
    -> apollo

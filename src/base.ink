=== base ===
~ location_name = "Time Corrections Agency (2413 A.D.)"
# BACKGROUND: locations/base.png
-> card_A

= card_A
# CLEAR
# AUDIOLOOP: audio/base.m4a
# SBIMAGE: locations/bob_ending.png
// Do we need a fixed seed???
// ~ SEED_RANDOM(127)
It’s always disorienting to return from a mission, but this one feels more unusual than the others. Stepping from the caisson, you’re greeted by Bob. Is that Bob? Something is diff… You sway but stay on your feet. He hands you a uniform and ushers you to the locker room where you can collect yourself. You change then look at yourself in the mirror. Your new clothes seem as out of place as you are.
Perhaps the caissons need to be re-calibrated? As you enter the hallway leading back to the chamber, Bob is there to greet you. He looks not at you, but through you, as though he is trying to discern what’s behind your eyes. With great solemnity, he reaches towards you, slowly, tenderly, and straightens the medallion that hangs from your neck.
    + {debug} [DEVELOPER:HEPHAESTUS] -> debug_hephaestus
    + {debug} [DEVELOPER:APOLLO] -> debug_apollo
    * [{continue}] -> card_B

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

= card_B
# CLEAR
# SBIMAGE: locations/bob_ending.png
As the two of you walk back towards the caissons, you begin to question Bob about the new uniforms. He holds up a finger as he hurries along, as though he knew what you were going to ask.
“There will be plenty of time for that. After you get some ‘rest’.” He grasps your shoulder and ushers you towards the caisson. “Orders have come down. It’s time to take a vacation.”
Order? To take a vacation?
“Taking care of Keith has opened some new doors. Strange doors. And well…” He doesn’t look at you. “The higher ups though you deserve time off… while we see what’s behind them.” The lighting is too bright in here, the air too stale. Only the constellations outside the window remain the same. Bob eases you back into the caisson and secures the restraints around your wrists and ankles. Restraints? Was this part of protocol? With a tug, you’re secured.
    * [{continue}] -> card_C
    
= card_C
# CLEAR
# ELIZA
# SBIMAGE: locations/base_tube.png
Bob steps back, a sad smile on his face but not in his eyes. “We’re sending you back to ancient Greece for a little R&R. Eliza will fill you in.” Eliza? “Laura’s understudy. They’ve decided that some of the staff needed time off..” He fiddles with his medallion, giving it a gentle pull before letting his arm hang to the side.
    * [{continue}] -> card_D
    
= card_D
# CLEAR
# SBIMAGE: locations/base_tube.png
Bob presses the button to start the time transfer. He looms above, while the cover of the caisson envelops your view, blocking his legs, neck, and smile, until at last only his distant, hollow eyes remain. The cover snaps shut with a hermetic hiss. He’s gone and darkness is everywhere.
    * [{continue}] -> card_E
    
= card_E
# CLEAR
# AUDIOLOOP: audio/alarm.m4a
In the black of the chamber, a light appears, rushing towards you. Videos of lush olive groves, bustling city centers, and craftspeople plying their trade fill your view and your senses. Great temples tower above, and by the sea, vacationers lounge with their cups, soothed by the sound of wine-dark waves. Beautiful music fills your ears and wonder fills your mind. 
A symbol flashes before your eyes on a background of static then it is gone.
Eliza begins to speak. “Welcome vacationer! You have earned… an unspecified amount of time …on the Greek paradise of Mypos, year 450 BCE. Your mission: enjoy yourself!”

    * [{continue}] -> workshop.transfer
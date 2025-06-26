=== debrief ===
~ location_name = "Time Corrections Agency Debriefing Lounge (2413 A.D.)"
# BACKGROUND: locations/debrief.png
# AUDIOLOOP: audio/debrief.mp3
-> lounge

= lounge
# CLEAR
# SBIMAGE: locations/bob_ending.png
// Do we need a fixed seed???
// ~ SEED_RANDOM(127)
It’s always disorienting to return from a mission, but this one feels more unusual than the others. Stepping from the caisson, you’re greeted by Bob. Is that Bob? Something is diff… You sway but stay on your feet. He hands you a uniform and ushers you to the locker room where you can collect yourself. You change then look at yourself in the mirror. Your new clothes seem as out of place as you are.
Perhaps the caissons need to be re-calibrated? As you enter the hallway leading back to the chamber, Bob is there to greet you. He looks not at you, but through you, as though he is trying to discern what’s behind your eyes. With great solemnity, he reaches towards you, slowly, tenderly, and straightens the medallion that hangs from your neck.
    + {debug} [DEVELOPER:HEPHAESTUS] -> debug_hephaestus
    + {debug} [DEVELOPER:APOLLO] -> debug_apollo
    + [{continue}] -> base

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

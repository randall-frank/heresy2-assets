# theme: light
# author: Copyright (C) STORY_YEAR Randall Frank, Andrew Florance & Marina Galvagni

INCLUDE globals.ink
INCLUDE item_globals.ink
INCLUDE base.ink
INCLUDE workshop.ink
INCLUDE garden.ink
INCLUDE temple.ink
INCLUDE agora.ink
INCLUDE pnyx.ink
INCLUDE marble_workshop.ink


// Need to build a lock widget:  https://codepen.io/carsonf92/pen/OGyyGQ


-> intro

=== intro ===
# BACKGROUND: greece.png
# AUDIOLOOP:

~ location_name = ""

<h1><b>αίρεση: Of what mettle Gods?</b></h1>
Athens Greece, 450 B.C. - The age of Pericles

<h2>Version: STORY_VERSION</h2>
    + [Begin the adventure] -> base
    + [Heresy background] -> background
    + [Quit] -> outro


// This tunnel is used to change the current power value up (+) or down (-)
// The value is capped [0,100] and if 0, the return will be redirected
// to the "end_game_power" game ending.
// Use it for combat, consuming batteries/recharge stations, etc
=== power_change(x)
    ~ exo_power += x
    { exo_power > 100:
        ~ exo_power = 100
    }
    { exo_power < 0:
        ~ exo_power = 0
    }
    { exo_power == 0:
        ->-> end_game_power
    }
    ->->

// This tunnel is used to change the amount of cash one has.
// At present, it does not redirect in any way, but it could...
=== cash_change(x)
    ~ cash += x
    { cash < 0:
        ~ cash = 0
    }
    ->->

=== function check_melampus_list()
    { oscillator and lcd_display and simple_battery and gold_wiring:
        ~ return 1
    }
    ~ return 0

// See norm.py for the derivation, but this function returns
// a floating point number from [0,100] with an approximate
// normal distribution.
// e.g. numbers around 50. have the highest probability.
// The approach was to compute the probability function
// and then fit that function to a 5th order polynomial
=== function rand_norm()
    ~ temp t = FLOAT(RANDOM(0,100))
    ~ temp f = 2.28564682
    ~ f = f + 0.776857910*t
    ~ f = f + 0.0590911716*t*t
    ~ f = f - 0.00219272853*t*t*t
    ~ f = f + 0.0000271392976*t*t*t*t
    ~ f = f - 0.000000109325083*t*t*t*t*t
    ~ return f

=== function attack_power()
TODO compute attack power (adjust based on items)
    ~ return 20.

=== function defence_power()
TODO compute defence power (adjust based on items)
    ~ return 50.

// do a round of combat.
=== combat(opponent, ref success)
    You are locked in combat with {opponent} who is {combat_health>exo_power: stronger|weaker} than you.
    // Compute base damage as = attack*(ratio/(ratio+defence))
    // Then weight by a sample from a normal distribution
    ~ temp dmg_to_other = INT(FLOAT(attack_power())*FLOAT(combat_ratio)/FLOAT(combat_ratio+combat_defence))
    ~ dmg_to_other = INT(FLOAT(dmg_to_other)*(rand_norm()/100.0))
    ~ temp dmg_to_player = INT(FLOAT(combat_attack)*FLOAT(combat_ratio)/FLOAT(combat_ratio+defence_power()))
    ~ dmg_to_player = INT(FLOAT(dmg_to_player)*(rand_norm()/100.0))
    You do {dmg_to_other} damage while they do {dmg_to_player} to you.
    -> power_change(-dmg_to_player) ->
    ~ combat_health -= dmg_to_other
    { combat_health <= 0:
        ~ success = 1
    }
    ->->

=== give_up ===
# CLEAR
# AUDIO: audio/shock.mp3
~ location_name = ""
-> power_change( -50 ) ->
You open a compartment in the ZXT Mark V and use a metal probe to short the battery terminals.  Sparks and smoke are emitted in the process.
    + [Again...] -> give_up


=== end_game_power ===
# CLEAR
# SBIMAGE: locations/quit.png
The android shell ran out of power.  The fluidic body cools and solidifies resulting in a "marble" statue left in remembrance of your presence.  Your mind lives on, trapped in an inert vessel, entirely devoid of stimulation... for eternity.
    -> outro

=== background ===
# CLEAR
This story is actually a continuation of the story used in the Heresy T.I.M.E Stories fan written expansion.  That expansion can be downloaded and accessed <a href="https://github.com/randall-frank/heresy-assets">here</a>. The expansion can be downloaded, printed and played.  It is also available as a Tabletop Simulator expansion pack on Steam.
If you are not in a position to play the game, a basic overview of the key game point is available.  Note: it does include spoilers.
    + [Give me the (spoiler) background] -> spoilers
    + [I just want to play Heresy II]
        # RESTART
        -> intro


=== spoilers ===
# CLEAR
TODO Heresy I spoilers
    + [{continue}] -> background

=== outro ===
# CLASS: end
# AUDIOLOOP:
~ location_name = ""
Thank you for your consideration.

    -> END

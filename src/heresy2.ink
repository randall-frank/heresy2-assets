# theme: light
# author: Copyright (C) STORY_YEAR Randall Frank, Andrew Florance & Marina Galvagni

INCLUDE globals.ink
INCLUDE item_globals.ink
INCLUDE base.ink
INCLUDE workshop.ink
INCLUDE garden.ink
INCLUDE temple.ink

-> intro

=== intro ===
# BACKGROUND: background.png
# AUDIOLOOP:

~ location_name = ""

<h1><b>αίρεση: Of what mettle Gods?</b></h1>
Athens Greece, 450 B.C. - The age of Pericles

<h2>Version: STORY_VERSION</h2>
    + [Begin the adventure] -> base
    + [Quit] -> outro

=== give_up ===
# CLEAR
# AUDIO: audio/shock.mp3
~ location_name = ""
You open a compartment in the ZXT Mark V and use a metal bar to short the battery.  Sparks and smoke are emitted in the process.
{ exo_power > 0:
	~ exo_power = exo_power - 50
	{exo_power < 0:
	    ~ exo_power = 0
	}
}
{ exo_power == 0:
    -> end_game_power
}
    + [Again...] -> give_up

=== end_game_power ===
# CLEAR
# SBIMAGE: locations/quit.png
The android shell ran out of power.  The fluidic body cools and solidifies resulting in a "marble" statue left in remembrance of your presence.  Your mind lives on, trapped in an inert vessel, entirely devoid of stimulation... for eternity.
    -> outro

=== outro ===
# CLASS: end
# AUDIOLOOP:
~ location_name = ""
Thank you for your consideration.

    -> END

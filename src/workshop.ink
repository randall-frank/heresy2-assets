=== workshop ===
-> wakeup

= wakeup
# BACKGROUND: greece.png
# CLEAR
# AUDIOLOOP: workshop.m4a
A twinge, a brief pain in the chest and you’re in another world.

You sit up, as cold as the grave you’re in. Eliza speaks from a console to the side. “Welcome Agent! We hope you enjoy your vacation and your new body: a brand new ZXT Mark V all-purpose android receptacle! Adaptable to any circumstances and nearly any form, they can practically make you a GOD. Now let’s get this body adapted to YOU.”

A click, a whirr, and life flows through you like a river undammed. The red warmth of life tumbles through new veins and across your skin. In an instant you are yourself… again.

 “My, don’t you look nice! Now keep in mind appearance and ability always come with a price!” Eliza must have seen you twitch. A tinny laugh comes from the console. “But this is an all-inclusive holiday! What I meant of course was the price is POWER. You’ll need batteries to keep operating, and if you don’t have enough energy your body may enter ENERGY SAVING MODE. That means your form could freeze, while your consciousness is preserved for centuries or even millennia to come! Now one last thing before you get out there to enjoy yourself…”
    * [{continue}] -> tattoo

= panarama
Along the hallway to your left is a robotic tattoo machine, room 236.  Room 237 is hidden behind a security door.  An open office space on the right holds a plain desk with a computer terminal. Finally, at the end on the left is what appears to be a holding cell.
    + [Take a seat at the tattoo machine] -> tattoo
    + [Try to enter room 237] -> door_to_oracle
    + [Take a seat at the desk] -> desk
    + [Examine the computer terminal] -> computer_terminal
    + [Investigate the cell] -> padded_cell
    + [Give up...] -> outro
    
= tattoo
# CLEAR
{ 
- tattooed:
You take a seat and the robot springs to life.  It scans your arm... "This detainee has already been marked.  Please move along." rattles Eliza.
    -> panarama
- else:
The slab you’re on spins and slides, coming to rest underneath a robotic arm. A laser tip hums to life. “Hold still and this won’t hurt a bit!” says Eliza from a speaker in the wall. The laser from a mobile begins to burn your right shoulder. It should hurt but the sensation is muted in this new form.
The laser makes a few motions like a painter’s final strokes on a canvas and the machine pulls away, leaving you with a strange symbol seared into your arm:
# IIMAGE: tattoo.png
“All done!” cheers Eliza. “Please proceed to the exit and prepare to have all the pleasures this island can offer.”
    ~ tattooed = 1
    -> panarama
}

= door_to_oracle
# CLEAR
# AUDIO: door_locked.m4a
A locked and bolted metal door with a digital keypad stands before you, looking like something that would protect the entrance to an underworld hideout. You try the door but it won’t budge, even with your considerable strength, you will need to find the keycode. Peering through the grille high upon the door, you glimpse the bronze escutcheon of Apollo on the wall.  Listening closely you overhear hushed whispers of Pythia’s great machine..   
    -> panarama

= desk
# CLEAR
An early 21st century modular desk sits covered in dust, probably one of the popular GUDMUND line from that. Stacks of papers stand atop, detailing transfers of office supplies, prisoners, and other sundries to the facility. A sticky note attached to one form contains a request for a red stapler. But there’s no stapler anywhere to be seen…
    + { not padded_cell_key} [Rifle through the drawers] -> find_padded_cell_key
    + [Return to the hallway] -> panarama
    
= find_padded_cell_key
You find a digital card key.  To what?  where?
    ~ padded_cell_key = 1
    ->panarama

= computer_terminal
# CLEAR
# AUDIO: computer.m4a
{
- computer_terminal > 1:
Your obvious fumblings have broken the computer terminal beyond simple repair. In your hands it has been reduced effectively to a pile of e-waste.
- else:
A computer terminal is built into what appears to be a marble slab. What a beauty! You run your hands over the display to admire the workmanship, and the feel of this hand-crafted design. But as your finger grazes the bezel of the display, it pops loose and you’re barely able to catch it as it falls towards the floor. The illusion of quality is gone but at least you’ll have a souvenir of your trip…
}
    + { not lcd_display} [Pry the LCD panel loose] -> find_lcd_display
    + [Return to the hallway] -> panarama
    
= find_lcd_display
The LCD panel might still be in working order in the right hands.
    ~ lcd_display = 1
    ->panarama

= padded_cell
# CLEAR
{
- padded_cell_key:
# AUDIO: door.m4a
You run the digital card key though the scanner.  There is a "beep" and the faded LED turns a muted shade of green.
This door is covered in dust and seems to have been sealed years if not decades ago. With a mighty pull you twist the bar open and peer into the dark cell before you. On the floor is a woman with long hair that spills around her feet. The name on her soiled jumpsuit says “Helen”?
- else:
A padded cell with a heavy, locked door.  It seems to be controlled by an ancient digital card reader.  Its swipe slot is caked with grime. A dimly lit red LED flickers off to one side.
}
    + [Return to the hallway] -> panarama
    

-> outro
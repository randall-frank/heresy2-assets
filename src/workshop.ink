=== workshop ===
~ location_name = "Mausoleum Workshop (450 B.C.)"
# BACKGROUND: greece.png
# CLEAR
# AUDIOLOOP: audio/workshop.m4a
-> power_change( location_change_cost ) ->
-> panorama

= transfer
~ location_name = "Mausoleum Workshop (450 B.C.)"
# BACKGROUND: greece.png
# CLEAR
# AUDIOLOOP: audio/workshop.m4a
A twinge, a brief pain in the chest and you’re in another world.

You sit up, as cold as the grave you’re in. Eliza speaks from a console to the side. “Welcome Agent! We hope you enjoy your vacation and your new body: a brand new ZXT Mark V all-purpose android receptacle! Adaptable to any circumstances and nearly any form, they can practically make you a GOD. Now let’s get this body adapted to YOU.”

A click, a whirr, and life flows through you like a river undammed. The red warmth of life tumbles through new veins and across your skin. In an instant you are yourself… again.

 “My, don’t you look nice! Now keep in mind appearance and ability always come with a price!” Eliza must have seen you twitch. A tinny laugh comes from the console. “But this is an all-inclusive holiday! What I meant of course was the price is POWER. You’ll need batteries to keep operating, and if you don’t have enough energy your body may enter ENERGY SAVING MODE. That means your form could freeze, while your consciousness is preserved for centuries or even millennia to come! Now one last thing before you get out there to enjoy yourself…”
    + [{continue}] -> tattoo

= panorama
Along the hallway to your left is a robotic tattoo machine, room 236.  Room 237 is hidden behind a security door.  An open office space on the right holds a plain desk with a computer terminal. Finally, at the end on the left is what appears to be a holding cell.
    + [Take a seat at the tattoo machine] -> tattoo
    + [Try to enter room 237] -> door_to_oracle
    + [Take a seat at the desk] -> desk
    + [Examine the computer terminal] -> computer_terminal
    + [Investigate the cell] -> padded_cell
    + [Exit via the iron gates] -> to_garden
    + [Capitulate...] -> give_up


= to_garden
# CLEAR
Peering through the iron grates, you see that the building has the facade of a mausoleum and is located at the edge of a large garden.
{
- garden_door_key:
    You use the key to open the garden gate and exit into the garden.
    -> garden
- else:
    -> panorama
}


= tattoo
# CLEAR
{ 
- tattooed:
You take a seat and the robot springs to life.  It scans your arm... "This detainee has already been marked.  Please move along." rattles Eliza.
    -> panorama
- else:
The slab you’re on spins and slides, coming to rest underneath a robotic arm. A laser tip hums to life. “Hold still and this won’t hurt a bit!” says Eliza from a speaker in the wall. The laser from a mobile begins to burn your right shoulder. It should hurt but the sensation is muted in this new form.
The laser makes a few motions like a painter’s final strokes on a canvas and the machine pulls away, leaving you with a strange symbol seared into your arm:
# IMAGE: items/tattoo.png
“All done!” cheers Eliza. “Please proceed to the exit and prepare to have all the pleasures this island can offer.”
    ~ tattooed = 1
    -> panorama
}


= door_to_oracle
# CLEAR
# AUDIO: audio/door_locked.m4a
A locked and bolted metal door with a digital keypad stands before you, looking like something that would protect the entrance to an underworld hideout. You try the door but it won’t budge, even with your considerable strength, you will need to find the keycode. Peering through the grille high upon the door, you glimpse the bronze escutcheon of Apollo on the wall.  Listening closely you overhear hushed whispers of Pythia’s great machine..   
    -> panorama


= desk
# CLEAR
An early 21st century modular desk sits covered in dust, probably one of the popular GUDMUND line from that. Stacks of papers stand atop, detailing transfers of office supplies, prisoners, and other sundries to the facility. A sticky note attached to one form contains a request for a red stapler. But there’s no stapler anywhere to be seen…
    + { not padded_cell_key} [Rifle through the drawers] -> find_padded_cell_key
    + [Return to the hallway] -> panorama
    
= find_padded_cell_key
You find a digital card key.  To what?  where?
    ~ padded_cell_key = 1
    ->panorama


= computer_terminal
# CLEAR
# AUDIO: audio/computer.m4a
{
- computer_terminal > 1:
Your obvious fumblings have broken the computer terminal beyond simple repair. In your hands it has been reduced effectively to a pile of e-waste.
- else:
A computer terminal is built into what appears to be a marble slab. What a beauty! You run your hands over the display to admire the workmanship, and the feel of this hand-crafted design. But as your finger grazes the bezel of the display, it pops loose and you’re barely able to catch it as it falls towards the floor. The illusion of quality is gone but at least you’ll have a souvenir of your trip…
}
    + { not lcd_display} [Pry the LCD panel loose] -> find_lcd_display
    + [Return to the hallway] -> panorama
    
= find_lcd_display
The LCD panel might still be in working order in the right hands.
    ~ lcd_display = 1
    ->panorama


= padded_cell
# CLEAR
{
- padded_cell_key:
# AUDIO: audio/door.m4a
You run the digital card key though the scanner.  There is a "beep" and the faded LED turns a muted shade of green. The door is covered in dust and seems to have been sealed years if not decades ago. With a mighty pull you twist the bar open and peer into the dark cell before you.
    -> talk_with_helen
- else:
A padded cell with a heavy, locked door.  It seems to be controlled by an ancient digital card reader.  Its swipe slot is caked with grime. A dimly lit red LED flickers off to one side.
}
    + { padded_cell_key} [Step into the cell] -> talk_with_helen
    + [Return to the hallway] -> panorama


= talk_with_helen
# CLEAR
On the floor is a woman with long hair that spills around her feet. The name on her soiled jumpsuit says “Helen”?

In an alcove on the wall, a mechanical owl spins its head and spouts gibberish in a sing-song voice. “Creaky creaky! Sneaky sneaky! What are you doing Bob-buuuuuuu!?” <bzzt> The owl shudders and ruffles its shimmering feathers.

At the mention of Bob the woman gasps like someone woken from a nightmare. She scrapes at her eyes and her face. Days, weeks, months of webs and spiders’ prey falls from her face. She clutches the sides of her head and stares at the owl, unblinking as she screams the word, “LAURAAAAAAAAA!!!”. Then as suddenly as she came alive, her skin goes cold and her features turn to stone.

… as she turns from you, a profound look of sadness ….  A item slips from her fingers to the floor, within your reach  (TODO: Item: Helen Locket??).

    + { not insane_laura} [Approach the owl] -> owl
    + [Return to the hallway] -> panorama


= owl
# CLEAR
# SBIMAGE: items/owl.png
An intricate mechanical masterpiece of animated genius. It flexes and flies with agility, perhaps even exceeding an anatomical predator. When close by, it even seems to breathe. But the eyes… they stalk you with visible intelligence.

Intelligence… yes,there is an undeniable intelligence present in this mechanical wonder.

On closer inspection, the owl hosts a quantum array storage vessel. This lightweight chamber is capable of storing the entire quantum state of a state of the art AI. The vessel sports a high-speed computer interface compatible with most computational platforms.
A faint glow emanates from the quantum storage nodes, suggesting that the vessel is currently occupied.

The owl seems to recognize you and drops a key to you.

    ~ garden_door_key = 1
    ~ insane_laura = 1
    + [Focus on Helen] -> talk_with_helen

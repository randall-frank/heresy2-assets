=== agora ===
~ location_name = "The Agora"
# BACKGROUND: locations/agora.png
# AUDIOLOOP: audio/temple.mp3
-> power_change( location_change_cost ) ->
-> panorama

= panorama
# CLEAR
The center of the city, the agora, is usually well cared for and ornately decorated. But the agora of Mypos has seen better days. Long rows of colonnades stretch out before, begrimed with dirt and soot from cooking meat. Multiple shady merchants have setup shop and on the margins, dark alleys loom.
There is a rather shady looking market place.  Guarded, side glances dominate this market.
Food options include an inexpensive food counter and higher-end restaurants.
A dark alley fills the gap between the eating establishments and an ironmongers.
    + [Visit the shady market] -> black_market
    + [Walk up to the food counter] -> fast_food
    + [Approach the fancy restaurant] -> restaurant
    + [Amble down the alley] -> alley
    + [Pay a visit to the ironmongers] -> hardware
    + [Travel to the Pnyx forum] -> pnyx
    + [Travel to Phidias workshop] -> marble_workshop
    + [Travel to the Temple of Hephaestus] -> temple

= black_market
# CLEAR
You approach the stall hoping to find some useful tools for the work ahead. A merchant smiles broadly at you and his tongue flicks behind a broken wall of teeth. He moves a filthy cloth to uncover a series of gadgets that hum in your mind with strange music.
“Everything’s for sale,” he purrs. “If you’re willing to pay the price… or willing to be paid.”
    { cash <= 0:
        His eyelids flicker as he scans you... "Everything has a cost but it looks like you have nothing to offer.  A pity, I would like to have been able to help you"
    - else:
        + {not crypto_unit and cash >= 2} [Quantum Crypto Unit: 2 Drachm] -> buy_crypto
        + {not quad_shield and cash >= 3} [Quadiken Shield: 3 Drachm] -> buy_shield
    }
    + [Return to the street] -> panorama

= buy_shield
One Quadiken Shield it is!
    ~ quad_shield = 1
    -> cash_change(-3) ->
    + [{continue}] -> black_market

= buy_crypto
One Quantum Crypto Unit it is!
    ~ crypto_unit = 1
    -> cash_change(-2) ->
    + [{continue}] -> black_market

= fast_food
# CLEAR
{ not tip_scales:
# SBIMAGE: items/scales.jpg
A marble counter serves food to those of the lower caste on Mypos. Those like you. The kitchen is strikingly modern behind the counter, with a stove, pressure cookers, and a soft-serve ice cream machine. A cook behind the counter shouts and sweats as he slings bowls of food.
The cook calls out to you, and his voice sings of riches. As you move forward to see what wares he has for sale, the owl swoops forward and lands atop a set of scales. As one arm drops, the other rises, and the owl adjusts to keep balance. But something is off.
The cook tries to shoo the bird away, but the owl flaps its wings and shifts its mass, tipping over the scales and sending a stack of five golden coins to the ground. The chef curses and rights the empty scales. That’s when everyone notices they’re uneven. The owl clicks a guttural sound as though laughing before it flies above the gathering crowd.
    ~ tip_scales = 1
    -> cash_change(5) ->
    + [{continue}] -> fast_food
- else:
There’s a crush of people at the counter, all of them bearing the mark of Keith. By the time you make it to the front, there’s little left. The cook swats at hungry customers during his free moments.
“Cold beans,” says the cook, gesturing to a rough bowl. “Take it or leave it.” He blows his nose into his apron then stares at you. “You heard what I said! Buy ‘em or go!” Seeing that you won’t discipline yourself, he reaches for a wooden spoon to strike you with.
    + {not fava_beans and cash >= 2} [Fava beans: 2 Drachm]
        ~ fava_beans = 2
        -> cash_change(-2) ->
        -> fast_food
    + [Create a distraction] -> chaos
    + [Return to the street] -> panorama
}


= chaos
# CLEAR
You lean across the counter and barely reach the soft-serve ice cream machine. You pop open the control panel and fiddling with the wires you overclock the dispensing rate to 11. You draw back and the machine begins to tremble, boiling over over with ice cream from every joint and opening.
{ RANDOM(0,10) > 3:
    Hearing the rattle, the cook turns and shrieks. At long last, inevitably, his bad dreams have come true.
    { not fava_beans:
        You take the opportunity to grab some beans.
        ~ fava_beans = 1
    }
- else:
The cook sees your game. He cracks you on the hand with a wooden spoon and spends quite a while telling you what a disappointment you are to everyone you know and everyone you don’t. He throws a clump of ice cream and the resulting shock resonates though your suit.
# AUDIO: audio/shock.mp3
    -> power_change(-5) ->
}
    + [Run away] -> panorama

= restaurant
# CLEAR
A maitre’d stands outside of a lavishly appointed restaurant, the bow tie with a toga is a bold fashion choice.
As you try to enter, the maitre’d clips a velvet rope to a stanchion by the door and stares with disdain at the symbol that marks you. “No entrance for the likes of you. Now leave before I call the guards.”
    + [Debase yourself and beg] -> beg
    + [Return to the street] -> panorama

= beg
# CLEAR
{ RANDOM(0, 10) > 4:
Why are you making a scene?! Fine, fine… take this and go away. Here’s something you could use.” He tosses you a recharge strip then turns to sunnily greet a couple who have arrived for their reservation.
You plug the strip into an arm socket and your outlook improves a little.
    -> power_change(10) ->
- else:
The maitre’d uncoils the velvet rope and proceeds to whip you with it. “Begone!” You flee under a hail of blows, with your pride being the only thing injured.
}
    + [Return to the street] -> panorama

= alley
# CLEAR
Two columns frame the entrance to a dark space between two buildings. Even in the midday sun, this alley remains black as night, a pathway to an unknown place. It’s littered with shards of broken amphoras and the smell of drunken sickness. You pass the remains of a roasted chicken boiling with flies, round a corner into a cloud of ionized gas, and find a puddle of stale water rushing to meet you before all goes dark.
When you awake you find your purse lighter. A pile of rags and shadows laughs in the corner. “Plouton will have his due. You’re lucky you’re not alive. He would have taken that too!” The creature laughs a phlegmy laugh and turns on its side.
Perhaps it would be best to leave while you can.
    -> cash_change(-1) ->
    + [Return to the street] -> panorama

= hardware
# CLEAR
A cluttered shop loaded with gadgets and gizmos covering every inch of the small crowded shop. A woman sits behind the counter soldering wires from a power source to a mechanical hand.
As you enter, the proprietor finishes her work. The hand twitches and she looks up at you, pleased. She sees the mark of Keith on your shoulder and her eyes smile. “I’m not supposed to sell to your kind, but if some parts walked off, what could I do?” She returns to her work.
    + { not gold_wiring} [Discreetly grab a spool of gold wiring]
        ~ gold_wiring = 1
        -> panorama
    + [Return to the street] -> panorama
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
“Everything’s for sale,” he purrs. “If you’re willing to pay the Price… or you’re willing to be paid.”
    + [Return to the street] -> panorama

= fast_food
# CLEAR
A marble counter serves food to those of the lower caste on Mypos. Those like you. The kitchen is strikingly modern behind the counter, with a stove, pressure cookers, and a soft-serve ice cream machine. A cook behind the counter shouts and sweats as he slings bowls of food.
There’s a crush of people at the counter, all of them bearing the mark of Keith. By the time you make it to the front, there’s little left. The cook swats at hungry customers during his free moments.
“Cold beans,” says the cook, gesturing to a rough bowl. “Take it or leave it.” He blows his nose into his apron then stares at you. “You heard what I said! Buy ‘em or go!” Seeing that you won’t discipline yourself, he reaches for a wooden spoon to strike you with.
    + [Return to the street] -> panorama

= restaurant
# CLEAR
A maitre’d stands outside of a lavishly appointed restaurant, the bow tie with a toga is a bold fashion choice.
As you try to enter, the maitre’d clips a velvet rope to a stanchion by the door and stares with disdain at the symbol that marks you. “No entrance for the likes of you. Now leave before I call the guards.”
    + [Return to the street] -> panorama

= alley
# CLEAR
Even in the midday sun, this alley remains black as night, a pathway to an unknown place. It’s littered with shards of broken amphoras and the smell of drunken sickness. You pass the remains of a roasted chicken boiling with flies, round a corner into a cloud of ionized gas, and find a puddle of stale water rushing to meet you before all goes dark.
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
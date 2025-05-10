=== hypermarket ===
~ location_name = "HyperMarket Redux"
# BACKGROUND: locations/hypermarket.jpg
# AUDIOLOOP: audio/hypermarket.mp3
-> power_change( location_change_cost ) ->
-> panorama

= panorama
# CLEAR
An odd sense of deja vu washes over you, have we been here before? You stand before a large, box-like structure with an advertisement covered facade announcing incredible deals found inside. As you approach the entrance, you notice the symbol 
# IMAGE: items/tattoo.png
decorating workers’, oddly hooded uniforms.  15th century Spanish clergy if memory serves.  There are no shoppers, just workers busily collecting items.
    + [Apparel section] -> apparel
    + [Deli counter] -> deli
    + [Garden center] -> gardening
    + [Automotive center] -> automotive
    + [Return to the Apollo computer room] -> apollo_backroom

= apparel
# CLEAR
Front: Two hooded figures stand in front of tables of unreasonably comfortable clothing at reasonable prices. You can’t see their faces. One is holding a strange device that looks like a gun but has too many barrels and they point at unusual angles. The other is holding up a pair of sweatpants for inspection. There is an ID badge on a stack of clothes on a table.
“I don’t know…” one says while holding up a pair of sweatpants for inspection “We have to wear the uniform, sure. But do you think they care what we have on under the robe?” The other shrugs. As you draw near, he raises his weapon. “I recognize you not, friend. What is your business here?”
    + [{continue}] -> panorama

= fitting_room
# CLEAR
A standard garment fitting room, but with an integrated garment scanner lock, currently showing “LOCKED”.
As you open the door and step in, the door closes behind you in a rather aggressive fashion, locking you in. You note yourself being observed via a camera in the back wall. A laser scanner sweeps over you, passing judgment.
    + [{continue}] -> panorama

= deli
This is a meat counter with a selection of sausages and cheeses available. A deli slicer and cash register rest at the end of the counter.  A solitary employee stands guard over the counter. Blocks of provolone and Swiss nestle between globes of mozzarella alongside a selection of salami, capicola and summer sausage. Astronomical placards stand like tombstones between the offerings.  
    + [{continue}] -> panorama

= gardening
# CLEAR
Unknown at present
    + [{continue}] -> panorama

= automotive
# CLEAR
Unknown at present
    + [{continue}] -> panorama

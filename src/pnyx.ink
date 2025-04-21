=== pnyx ===
~ location_name = "The Forum at Pnyx"
# BACKGROUND: locations/pnyx.jpg
# AUDIOLOOP: audio/temple.mp3
-> power_change( location_change_cost ) ->
-> panorama

= panorama
# CLEAR
A small square opens in front of you. A group of people is assembled around an orator, who is   vehemently lecturing them. On the side, an old man inside a wine barrel grins at you and moves his hand as if to ask you to approach him.
    + [Circulate though the crowd] -> audience
    + [Travel to the Agora] -> agora

= audience
# CLEAR
You approach the audience, but everyone is too busy listening to the orator to pay attention to you. You can only hear them murmur “Yes, yes, that makes sense… with all these weird bárbaros that keep coming here, we need to go back to the roots of the Athenians' knowledge. And its key is in the philosophers' secrets”.
You leave them to their thoughts and comments.
    + [Step back] -> panorama

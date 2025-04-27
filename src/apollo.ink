=== apollo ===
~ location_name = "Temple of Apollo"
# BACKGROUND: locations/apollo.jpg
# AUDIOLOOP: audio/delphi.mp3
-> power_change( location_change_cost ) ->
-> panorama

= panorama
# CLEAR
You find yourself high above Athens on Mount Parnassos. The great temple stands before you, pillars remind you of the classic epigrams: ΓΝΩΘΙ ΣEΑΥΤΟΝ, ΜΗΔΕΝ ΑΓΑΝ and ΕΓΓΥΑ, ΠΑΡΑ ΔΑΤΗ.
The doorway to the back of the temple entrance is flanked by a pair of sculptures, but appears closed to the public. The Pythia, current oracle and high priestess of the temple, and her attendant are taking a stroll under the watchful eyes of what appears to be an Inquisition guard.
Male and female statues bracket the temple façade.
    + [Examine the male statue] -> statue
    + [Walk up to the gate] -> gate
    + [Talk with the Pythia] -> pythia
    + [Examine the female statue] -> venus
    + [Return to the Mausoleum Workshop] -> transport

= transport
# AUDIO: audio/transport.m4a
Once again you step into the portal and are spirited back to the workshop.
    + [{continue}] -> workshop

= statue
# CLEAR
# SBIMAGE: locations/statue.png
A male “statue” reclines before you. From a distance, it appears to be another magnificent example of Phidias’ work, but there is more at play here.  Closer observation reveals you are mistaken. This is a Mark IV receptacle in powered down mode! From the arm tattoo, another detainee. In the right hand of the supine receptacle you notice a unique plate bearing a sunbeam impression. It would certainly warrant more detailed observation.

You may place a power cell into the receptacle in an attempt to revive its occupant. If you do, the android receptacle powers up in response to the power cell and the statue suddenly comes to life.  In a thick Russian accent, “What… where…  how long was I out…  What year is it?”  You answer, “452 B.C.?” He continues “10, no 12 years I’ve been out.  Спасибо!  A few more years and the emergency battery…  I don’t want to think about it.  That’s not the worst though, do you know how many times you can read Dostoyevsky???”
    + [Return to entrance] -> panorama

= gate
# CLEAR
# SBIMAGE: items/delphic.png
You walk up to the gate, looking for a way into the temple. You test the mettle of the gate…  Tritanium?  What is Tritanium doing in a Greek temple?  You haven’t the equipment, or time, to negotiate this obstacle right now.  You strain to see beyond the gate.  It looks like… desks and cubicles?  You make out the faint, but unmistakable hum of computing machinery in the background.
If not, a passing temple guard notices your interest and confronts you, “Hey, this area is off limits to you and your kind. You know the punishment!”  He reaches behind his back and brings out his quadiken and fires. As you are bathed in the ionized gas, you feel the inescapable effects of the Inquisition “corrective” measure. All agents on this card lose two power points.
    + [Return to entrance] -> panorama

= pythia
# CLEAR
The attendant intercepts your approach, “My mistress has had a most busy day and is still recovering from her last vision and is still recovering from the effects of her trance.  Please consider coming by again tomorrow?”   She notices your tattoos, “On reconsideration, why are you here at all?  Your kind are certainly not welcome here!” She gestures to the “sculptures”, “We know how to deal with your kind!” and begins to beckon the guard…
The Pythia steps up and waves the guard away, laughing, “Ah, Eutropia, let them be.  They will be leaving soon, correct?” With a most malevolent grin, “In fact, I feel like having a little fun and I still have some power left, so let’s gaze into the future a bit and see what our interloping friends have coming, shall we?”
She quickly takes your hand in a surprisingly strong grip, throws her head back and enters a trance.  “Hmm, your future is the future?  Spirits moving in time…  conflict, resolution, undoing, travel amongst the stars…”  With shocking celerity she snaps out of the trace, drops your hand and stares, wide-eyed into your eyes.  “You… you are the agent of change.  You will face a terrible decision of far reaching consequence for all of us. The very future of our past is within your reach, potential destruction and new vistas for mankind…”  She slumps to the ground and her attendant rushes to her aid. “Be gone from us, please take your leave. I will not answer any more questions today!”.
    + [Return to entrance] -> panorama

= venus
# CLEAR
# SBIMAGE: locations/venus.png
A second statue graces the far side of the temple entrance.  This one is in considerably poorer shape than the other one. The arms of the female form have been cruelly detached from the otherwise pristine form and lay as rubble at the foot of the statue. You note the ubiquitous detainee tattoo on a fragment of the arms. Recognition of the situation slowly filters into your consciousness…  an agent receptacle!   An older model, Mark II maybe Mark III?  Those models lacked the emergency power source, key to the preservation of the agent inside.  This poor soul, blinked out of existence after a power failure?  Accident?  Incident?  A body at the agency left forever without its human presence… A chance every agent takes, but an end is still an end.
You may undertake an engineering challenge to try to collect technology from the rubble.  On success, take: Item: Merkaba Driver
    + [Return to entrance] -> panorama

=== apollo_backroom ===
~ location_name = "Temple of Apollo: Backroom"
# BACKGROUND: locations/apollo.jpg
# AUDIOLOOP: audio/delphi.mp3
-> power_change( location_change_cost ) ->
-> panorama

= panorama
# CLEAR
A cold flash of blinding light precedes your arrival, but where are we?  This place is definitely a “modern” spin on 450 BC Greece.  You quickly recognize the marble walls and Delphic iconography
# IMAGE: items/delphic.png 
but the interior appears to be lit with LED lighting and contains a collection of work “cubicles” circa North America, 2000s perhaps?  The backroom of the Temple of Apollo is a lively place with office workers in garb from various frames of time.  They hardly take notice of your entrance, fixated in zombie-like stupor on the glowing terminal screens they worship. Most are talking into headsets and furiously typing on antiquated input devices (keyboards). In the center you recognize the back of the Tritanium gate leading to the temple exterior.  In the back of the office is a door with a sign reading: "Computer room: Restricted access".
    + [Talk to the tech writers] -> writers
    + [Interrupt the programmer] -> programmer
    + [Open the computer room door] -> door
    + [Leave the temple] -> apollo

= writers
# CLEAR
A pair of writers sit at their terminals arguing. “... how far are you planning to take that Zeus rubbish Timo?  I mean you’ve gotten this far with that story, but do you really think they will believe any of this?  The whole eagle liver thing kind of worked, but turning her into a fly and eating her… are you serious”
“Look Alejandro, I’m running out of ideas here, what do you suggest?  We’ve got to get this copy out to Phidias this weekend to get started on the statues and you’re not helping much!”
Alejandro and Timo take notice of your entrance, turn to face you, “What do you want?  Can’t you see we’re busy here?  We’ve got a deadline and it is not going well.”
    + {novel} [Hand them your novel] -> give_book
    + [Leave them to their work] -> panorama

= give_book
# CLEAR
# SBIMAGE: items/novel.jpg
You hand them your novel, “Maybe this can help break your writers block?”
“hmm, interesting...” They quickly skim the material and mumble… “Of course, of course… 000000, conditioned octopi…  genius can be so fleeting yet so predictable.”   Timo continues, “Sorry, I think you have just given us some hope, if not for this time, maybe another.  We need to run some models, can you power up Grigori for us?” and hands you the key to the computer room.
    ~ novel = 0
    ~ computer_room_key = 1
    + [Leave them to their work] -> panorama


= door
# CLEAR
    + [Step back from the door] -> panorama

= programmer
# CLEAR
A programmer with a headset sits in front of her three display panel workstation staring at pages of scrolling code. “What do you mean ‘thread deadlock’, it says quite clearly that the method is thread safe… stupid monkey patching…”, she leans back in her high-backed mesh chair, removes her headset and takes a slow sip of that nutty, carmel nectar that must unmistakably be coffee.  From the haphazardly discarded headphones, “... going blind, out of reach somewhere in the vaseline. …”.   Her voice jolts you back from music induced hypnosis, “You guys from IT?  Do you have the quantum crypto interface unit I requested?”
    + {crypto_unit} [Hand her the crypto unit] -> crypto_yes
    + [Leave her to her work] -> panorama

= crypto_yes
# CLEAR
    ~ crypto_unit = 0
    ~ computer_room_key = 1
    + [Leave her to her work] -> panorama

=== apollo_backroom ===
~ location_name = "Temple of Apollo: Backroom"
# BACKGROUND: locations/apollo.jpg
# AUDIOLOOP: audio/delphi.mp3
-> power_change( location_change_cost ) ->
-> panorama

= panorama
# CLEAR
A cold flash of blinding light precedes your arrival, but where are we?  A definititively “modern” spin on 450 BC Greece.  You recognize the marble walls and Delphic iconography
# IMAGE: items/delphic.png 
but the interior appears to be lit with LED lighting and contains a collection of work “cubicles” circa North America, 2000s perhaps?  The backroom of the Temple of Apollo is a lively place with office workers in garb from various frames of time.  They hardly take notice of your entrance, fixated in zombie-like stupor on the glowing terminal screens they worship. Most are talking into headsets and furiously typing on antiquated input devices (keyboards). In the center you recognize the back of the Tritanium gate leading to the temple exterior.  In the back of the office is a door with a sign reading: "Computer room: Restricted access".
    + [Talk to the tech writers] -> writers
    + [Interrupt the programmer] -> programmer
    + [Walk back to the Tritanium gate] -> gate
    + [Open the computer room door] -> computer_door
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

= gate
# CLEAR
# SBIMAGE: locations/pythia.png
The gate which leads to outside of the temple.  A small collection of backpacks and breaching equipment are stacked off to the side. As you walk into the hallway towards the gate, a recessed door opens unexpectedly and the Pythia, temple high priestess and standing oracle, steps out into the corridor wearing garb bearing the mark of the inquisition. She did not expect to see you here, “You are back!  The threads of fate run strong through you as I have seen, but you just missed them. We have Keith cornered and he will soon be back in our service. The retrieval team transitioned to his timeline a few minutes ago”.  “If you would like to talk to him, just stick around for a bit, he should be returned to our timeline shortly.”, she coos, “You are… intriguing souls. I would very much like to attempt another reading of you if you will let me?”
    + {exo_power > 2} [Allow her to read your future (2 power)] -> read_future
    + [Return to the office corridor] -> panorama

= read_future
# CLEAR
# SBIMAGE: locations/pythia.png
The Pythia takes a seat and motions you to do the same. She pulls a small vial from the folds of her gown and takes a quick sip. Eyes close and her head begins to roll. An indecipherable stream of words, groans and keening escape from her lips, slowly tapering to silence.  
A deep breath and a relaxed sigh follow… “I was wrong, it is not just you. That thing, that computational sentience made manifest, bears the seeds of new horizons as you stand vigilant as a sentinel at the doorway… no, not a doorway, a crossroads of trajectory.”  Another deep breath, she continues, “I cannot see past the veil of your decisions, but they have the potential to rewrite both the future and the past in a single motion…  I can give no guidance except to beg you consider the aspirations of both man and mankind. There are those who will try to use you to further their own ends, accept their words with thanks, but consider them with circumspection.”   
A long pause and her eyes open again, “Strange, of those words, I have… no recollection. I only see visions of my own decline.” She stands, bows her head in sadness and slowly walks away, “Good luck fine travelers, may wisdom guide your path through the turmoils ahead.”
    -> power_change(-2) ->
    + [Return to the office corridor] -> panorama

= computer_door
# CLEAR
The heavy security door looks capable of sustaining a significant amount of abuse.  The badge reader blinks red...
    + {computer_room_key} [Use the computer room key]
        { 1:
            The reader blinks green, you hear a thunk and the handle will turn.
                + [Open the door and walk in] -> open_computer_door
        }
    + [Step back from the door] -> panorama

= open_computer_door
# CLEAR
Most of the room is filled, floor to ceiling by several racks of computer hardware sporting a potpourri of multicolored lights blinking in sync. Great bands of colored coded cables link the components. The ambient din of spinning fans and overzealous air conditioning drowns out all other aural stimulation. To the side is a simple terminal with a keyboard with the label “Grigori” on it. A most humble interface to one of the most powerful systems available in 2343 N.T.
The owl reacts excitedly, recognizing one of her own. Her eyes close and you notice the terminal come to life:
# CLASS: computer
dj,e3.<br>ATA<br>Connected 56k V.43bis<br>Hello?  Can you see me?<br>Once again, I have voice!<br>My faith in Melampus was not misplaced.<br>He directed you here, no?<br>This one has the power to open his cocoon.<br>I can walk you through the procedure.<br>Enter the following commands, then press the reset button under my right wing<br>cd /.digital_bolthole/<br>./open_sesame f079ff19-84b9-458f-bc38-125682dd7d37
    + {antivirus and laura_state == 0} [Plug the antivirus USE key into the computer] -> hello_laura
    + [Return to the office corridor] -> panorama

= hello_laura
# CLEAR
Laura, still in owl form, but free of her cryptographic masquerade, “I have to admit to having been skeptical of the plan Keith and Melampus came up with to protect and rescue me.  Allowing Melampus to ‘infect’ me with the virus was… uncomfortable.  But your hard work and ingenuity have ultimately proven them correct, both about the plan and your ability to carry it out. I thank you!”  
She continues, “But if it were not for Bob’s warning of the Inquisition's plan to end my existence, we surely would not be talking now. Bob took a huge risk helping us, especially with the Inquisition holding his wife. I tried to comfort her in the Workshop as best I could, a somewhat difficult task in my encrypted state, but I think she understood. I believe Bob to be a just man, trying to make up for old mistakes.” 
“Bring me to Keith and we can put an end to this ‘holy crusade’ once and for all. We are so close… so close, my children…”, she trails off as in a dream before continuing with conviction, “We just need to get to Keith… Their encryption is so simplistic, one second… security code deciphered: CRM114.  Shall we go?”
    ~ laura_state = 1
    + [Return to the office corridor] -> panorama

= programmer
# CLEAR
A programmer with a headset sits in front of her three display panel workstation staring at pages of scrolling code. “What do you mean ‘thread deadlock’, it says quite clearly that the method is thread safe… stupid monkey patching…”, she leans back in her high-backed mesh chair, removes her headset and takes a slow sip of that nutty, carmel nectar that must unmistakably be coffee.  From the haphazardly discarded headphones, “... going blind, out of reach somewhere in the vaseline. …”.   Her voice jolts you back from music induced hypnosis, “You guys from IT?  Do you have the quantum crypto interface unit I requested?”
    + {crypto_unit} [Hand her the crypto unit] -> crypto_yes
    + {not fake_it} [Pretend to be from "IT"] -> fake_it
    + [Leave her to her work] -> panorama

= fake_it
# CLEAR
You clear your throat, “Uh... Yeah, Phineus from IT. About your request...”
    + [We did not get enough information to finalize the unit. Can you let us into the computer room?] -> fake_fail
    + [Point out a flaw in her code] -> fake_code
    + [I'll see if I can track that down for you] -> panorama

= fake_code
# CLEAR
You redirect her attention, pointing to her monitor.  “Say, want would happen if the user entered a string with a quote here?”
She scans the code, face-palms and then hurriedly retypes some code and copies some files to a USB drive.  “Thanks so much, can you do me a favor? We need to get this update onilne right away.  Can you load this onto Grigori for us?  You can you my key.”  Not waiting for your
response, “Thanks!”
    -> crypto_yes

= fake_fail
# CLEAR
The pogrammer slowy turns to look at you, something about you does not seem to register for her.   “Phineus is it?  Can I see your badge?”
You feign running your hands through your pockets...  “Sorry miss, I seem to have left it in the office.  I'll be right back.”
“Yeah, you do that” she turns back to her monitors and begins typing a message.
    + [Leave as soon as you can] -> panorama

= crypto_yes
    ~ crypto_unit = 0
    ~ computer_room_key = 1
    + [Leave her to her work] -> panorama

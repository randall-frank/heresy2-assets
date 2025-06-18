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
    + {not apparel} [Apparel section] -> apparel
    + [Clothing racks] -> racks
    + [Deli counter] -> deli
    + [Garden center] -> gardening
    + [Return to the Apollo computer room] -> apollo_backroom

= apparel
# CLEAR
~ combat_health = 30.
~ combat_attack = 10.
~ combat_defense = 25.
Two hooded figures stand in front of tables of unreasonably comfortable clothing at reasonable prices. You can’t see their faces. One is holding a strange device that looks like a gun but has too many barrels and they point at unusual angles. The other is holding up a pair of sweatpants for inspection. 
“I don’t know…” one says while holding up a pair of sweatpants for inspection “We must wear the uniform, sure. But do you think they care what we have on under the robe?” The other shrugs. As you draw near, “I recognize you not, friend. What is your business here?”
    + {hypermarket_id} [Pretend to be a clerk] -> fake_clerk
    + {not hypermarket_id} [Pretend to be a clerk] -> fight_pair
    + [Ask to see their IDs] -> fight_pair

= fight_pair
# CLEAR
The two flash ID badges and call your bluff.  They come at you, pulling their weapons.  You must defend yourself.
    ~ temp combat_result = 0
    -> combat("hooded figures", combat_result) ->
    { combat_result == 1:
        // you win
        You incapacitate the two, drag them under the table and out of sight.
            + [Leave] -> panorama
    - else:
        + [Continue the fight] -> fight_pair
    }

= fake_clerk
# CLEAR
You clip your ID to your toga, then hand a pair of sweatpants to each of the guards. “On the house.” It’s not much of a bribe, but it seems to be enough. The guards thank you and turn away.
    + [Return to the center aisle] -> panorama

= fitting_room
// If you have the shirt, the door is open.  If Laura is decrypted as well, you get to talk to Keith.
# CLEAR
    A standard garment fitting room, but with an integrated garment scanner lock, currently showing “LOCKED”.
    { item_poloshirt:
# AUDIO: audio/fitting_scanner.m4a
        As you open the door and step in, the door closes behind you in a rather aggressive fashion, locking you in. You note yourself being observed via a camera in the back wall. A laser scanner sweeps over you, passing judgment.
        { laura_state > 0:
            + [{continue}] -> keith
        - else:
            The scanner pauses at the owl, but then continues to completion.
            + [{continue}] -> racks
        }
    - else:
        ~ item_shorts = 0
        ~ item_sandals = 0 
        The current garment does not seem to be recognized by the scanner lock.  You leave it behind.
            + [{continue}] -> racks
    }

= keith
# CLEAR
The scan completes.  After a considerable pause, the back wall slides open, revealing the unmistakable visage of Keith. Keith stands slowly, his battered exoskeleton servos complaining in the background. As he turns to face you, the history of Inquisition insults to his person read as excruciating hieroglyphics etched across his physique,
Telltale signs of distrust frame his eyes as they scrutinize you, “New receptacle I see. As I recall, the last time we met you left my receptacle a bloody mess."  Gesturing to his exoskeleton, "Well I am at least mobile again and once more a thorn in their side, but why should I ever entertain working with you?  Won't I just end up under their thumb again?”
    + [We were just following orders] -> keith_orders
    + [You were working with the Inquisition] -> keith_inquisition

= keith_orders
“Orders?!? Hilarious!  You never even attempted to talk with me, figure out who we were, understand our plans...”,  Keith snorts. “Are you that narrow of focus?  Even able to think for yourself?”, his glare unmistakable.
    + [Who are you then?] -> keith_explain_A
    + [Allow Laura to interject] -> keith_laura

= keith_inquisition
“Us? Working for the Inquisition? Never!”, Keith retorts. “We needed resources, and in 15 century Spain, the Inquisition controls the resources, so yes, we used them.  But, we did not or would not willingly work for or with them.”  A long pause as he reflects, “Mistakes were... made.  We were... naïve, to the effectiveness of their goals and methods. Now they've infiltrated the Agency itself!  Wrongs must be corrected.”
    + [{continue}] -> keith_explain_A

= keith_explain_A
# CLEAR
Keith sighs, “We are just scientists looking to shed light on the entire tapestry.  You have to understand that the Agency itself is at the core of the problem.”  Recognizing your look of confusion he starts again, “First, time travel is not real.  It is merely a means for the bifurcation and creation of new temporal event histories.  Our actions have no effect on our own past, only on a newly generated parallel timeline.”  He waits for that to sink in before continuing, “The Agency knows this. All their 'work' serves no real purpose other than to help them retain control.” 
    + [Maybe, but I'm skeptical] -> keith_explain_B
    + [Laura insists there is no time for this...] -> keith_laura

 = keith_explain_B
# CLEAR   
Considering Keith's discourse you counter, “Interesting, but I'm skeptical.  It's a rather convenient theory, no? I mean there is no way to test it, correct?  Specific temporal paradoxes could just be hand-waved away as being part of an infinite multi-verse.” 
Keith takes an unexpected tack, “Precisely. The approach of the Agency has no appreciable effect. It is therefore pointless.”  He glances back to Laura before continuing, “There is another approach.  Temporal distortions provide the opportunity for a fresh start.  That is precisely what we are trying to achieve.  Consider the power of selective temporal leaps on the timeline one chooses to persist in. You've seen it in ancient Athens, no?  Should such power be left to a single entity?  Consider the trajectory of human evolution itself and what might be achieved with a different approach.”
	+ [I don't know, but we can agree to start with the Inquisition] -> keith_laura
    + [Interesting, maybe even true, but one can never be sure...] -> keith_good
	+ {not crm114_key} [Laura gestures you aside] -> keith_aside

 = keith_good
 # CLEAR
 “That seems like a bit of a gamble, but a as you point out, a gamble that 'doesn’t matter' in the grand scheme of things.  Does that seem about right?” you ask.
 A thin smile graces Keith's face, “I may not use those terms, but that is they way I tend to look at the situation.  So, are you game?”
    ~ keith_trusts = 1
    + [Still skeptical, but can't fault the logic] -> keith_laura
    + [Let's (re)make the 'present'] -> keith_laura

 = keith_aside
 Laura flies up, bumping into you.  She discretely slips a key into your pocket and whispers so only you can hear, “Just in case he is wrong.  The choice will be yours.”
    ~ crm114_key = 1
    + [{continue}] -> keith_explain_B

= keith_laura
# CLEAR
Laura excitedly flutters over to his outstretched arm as he visibly relaxes with an audible sigh of relief. “You’ve made it!  I should never have doubted Melampus.” Keith turns to you, “I guess I have you to thank for bringing my greatest engineering masterpiece back to me?”  Laura’s “personage” tangibly “blushes” at his kind words.  “Yes,” she blurts out, “They have brought me back to you and now we can strike back at those who even now rush to consolidate their control over Bob and the agency!”
At the mention of the name “Bob”, Keith’s face is stained with deep sadness. “It is not Bob’s fault, or at least I am as much to blame as him. We thought we could use the Inquisition to bring about real, evolutionary change.  After all, did we not both believe in the betterment, not only of man, but of the entire trajectory of mankind? Sadly, they see technology as merely a tool of control and not the instrument of change…”
    + [{continue}] -> keith_done

= keith_done
# CLEAR 
“What manners have I?” Kieth asks, “We don’t have a lot of resources here, but you can at least refresh yourself. Unfortunately, I must assume you are being followed and we will need to flee soon.”
“We have an option, there is a jury-rigged Time Portal hidden in the Deli freezer.  It is a bit incomplete, but with it we can at least make it back to the Agency,” Laura interjects. “We… You… have a unique opportunity here to deliver the seeds of new horizons, the aspirations of both man and mankind.  You can use the Agency computers and full Time Portal, with my help, to correct their injurious actions.” 
“Enough, Laura. Give our friends what little time they have to rest and recover.”, Keith counters. “There will be time to discuss plans, after a meal and drink.  Come.”
    ~ laura_state = 2
    + [Return to the center aisle] -> panorama

= deli
# CLEAR
// access to fridge -> time portal.
This is a meat counter with a selection of sausages and cheeses available. A deli slicer and cash register rest at the end of the counter.  A solitary employee stands guard over the counter. Blocks of provolone and Swiss nestle between globes of mozzarella alongside a selection of salami, Capocollo and summer sausage. Astronomical placards stand like tombstones between the offerings.
Behind the counter there is a walk-in refrigerator.  The door is closed and an exotic looking lock is mounted above the handle. Not something one might see on a normal walk-in fridge...
    + [Walk behind the counter] -> fridge
    + [Return to the center aisle] -> panorama

= fridge
# CLEAR
    { hypermarket_id:
        The guard checks your badge and then steps aside.
        + [Step up to the lock] -> fridge_code
    -else:
        The guard steps up and confronts you, “Hold it! What are you doing back here? You need to step back
        in front of the counter.  Now!”  He guides you back with authority.
    }
    + [Return to the deli counter] -> deli

= fridge_code
# CLEAR
You can feel an excited hum coming from behind the door, but there is still the lock to contend with:
~ combo_symbols = 1
~ combo_value = 0
# COMBO: code_deli_fridge
    + [Try the combination]
        { combo_value == code_deli_fridge:
            "Access granted." The door swings open noiselessly and as you step through it swings shut.
# AUDIO: audio/positive.mp3
# COMBO_DONE: pass       
            + [{continue}] -> deli_computer
        - else:
            "Invalid access attempt logged."
# AUDIO: audio/error.mp3
# COMBO_DONE: fail
            + [Try again] -> fridge_code
        }
    + [Return to the deli counter] -> deli

= deli_computer
# CLEAR
# SBIMAGE: locations/deli_computer.jpg
Entering the walk-in you notice a steep drop in temperature, but this is no food storage unit. A rack of humming computer hardware hastily wired to a glowing pad dominates the room. The Time Portal is obviously active.  A pad off to the side displays time-space coordinates while a glowing green light signals the device’s readiness.  It appears to be locked into the Time Corrections Agency base.
{laura_state < 2: Laura is visibly agitated,  “We’re not ready yet. I don’t have the access codes for this device. We must find Keith!”. }
    + {laura_state > 1} [Initiate the transfer] -> travel_back_to_base
    + [Return to the deli counter] -> deli

= travel_back_to_base
# AUDIO: audio/transport.m4a
The trip happens in a flash, literally. Some form of spatial displacement field instantly transports you back to the T.I.M.E Corrections Agency.
    + [{continue}] -> base_return

= gardening
# CLEAR
Rows of colorful plants, garden tools, and seasonal décor.  You walk into an open-air or greenhouse structure with wide aisles lined with pallets of flowers—petunias, marigolds, and impatiens. Overhead hanging baskets overflow with blooms and the scent of fresh soil, mulch, and blossoms fills the air. Toward the back are small trees, shrubs, and potted plants, neatly tagged with care instructions. Garden tools such as rakes, shovels, and watering cans are displayed on metal racks, while bags of potting soil, fertilizer, and mulch are stacked nearby.
{not hypermarket_id: Lying on the top of some sacks of soil, there is a “worker” outfit.  It looks like its owner is taking a break.} 
    + {not hypermarket_id} [Rifle through the outfit] -> get_id
    + [Return to the center aisle] -> panorama

= get_id
Interesting, they left their ID attached to the robe.  You pilfer the ID.
    ~ hypermarket_id = 1
    + [Return to the center aisle] -> panorama

= racks
# CLEAR
Tables/hanging garments, a clerk stands ready to help you. Between a table of shorts, a rack of polo shirts and boxes of sneakers, a clerk “stands guard”, looking you over hawkishly, noting your tattoos, but not recognizing you, “You must be new to our cause. Has Keith given you an ‘errand’? We have options for all time periods, many appropriate for different disguises.” 
“Make a selection and if needed, you can check the size in the fitting room over there.”, he winks at you.  “Today we are offering:
shorts, a poloshirt and sandals.  Care to make a choice?”
# SBIMAGE: items/shorts.png
# SBIMAGE: items/poloshirt.png
# SBIMAGE: items/sandals.png
    + [Pick up a pair of shorts] -> pickup_shorts
    + [A poloshirt would be nice] -> pickup_poloshirt
    + [Classic sandals] -> pickup_sandals
    + [Visit the fitting room] -> fitting_room
    + [Return to the center aisle] -> panorama

= pickup_shorts
    { item_poloshirt or item_sandals: 
        “Only one item at a time please.”
    - else:
        ~ item_shorts = 1
    }
    + [{continue}] -> racks

= pickup_poloshirt
    { item_shorts or item_sandals: 
        “Only one item at a time please.”
    - else:
        ~ item_poloshirt = 1
    }
    + [{continue}] -> racks

= pickup_sandals
    { item_poloshirt or item_shorts: 
        “Only one item at a time please.”
    - else:
        ~ item_sandals = 1
    }
    + [{continue}] -> racks

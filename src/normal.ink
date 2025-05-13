=== normal ===
~ location_name = "Time Corrections Agency (2413 A.D.)"
T.I.M.E Stories Base: 2341 (“Keith’s dead, Bob’s back ending” postscript)
# BACKGROUND: locations/base.jpg
Near a bank of computers, a group of agents celebrates your victory. They drink from glasses of wine as they tear inquisition patches from their uniforms. One drunkenly stumbles up and apologizes to you.
He raises a bottle of red wine in salute, gives you a sad purple smile then steps away. But as he does so, he trips, losing his grip, sending the bottle of wine spilling over the delicate instruments of a time transit control panel. They sizzle. There are gasps as his colleagues realize what he’s done, but he waves them away from his comfortable place on the floor. “Those things don’t do anything anymore. Laura’s back in charge!”
Sighs of relief fill the air and glasses are raised high. “To Laura!”
    + [{continue}] -> panorama

= panorama
# CLEAR
Two one side you see the Inquisition acolytes and their leader being hustled away by armed guards. Bob has been reunited with Helen and they gesture toward you. On the far side of the room an agent is covering the Eliza mainframe unit with a tarp.
    + [Talk to the Inquisition prisoners] -> inquisition
    + [Join Bob and Helen] -> bob
    + [Examine the Eliza mainframe] -> eliza_retro

= inquisition
# CLEAR
Three robed figures are on their knees, praying. Two have their hoods up and their faces are hidden. The third has his hood down. He is an old man, impossibly old.  Tears run down his face. He is smiling. He holds a small book that is open. He stares upward. A man with an assault rifle stares down at him.
The old man whispers, “Te, Dómine, sancte Pater, omnípotens aetérne Deus, supplices deprecámur pro anima famuli tui N., quem de hoc sǽculo ad te venire iussísti…” He stares at you as you walk up before continuing. “We are all in your hands. Your path has been set and I will not question it any longer. Grant us the peace of a joyful death.”
The guard nudges the man with his gun. “Get moving.”
The old man removes what looks like a communion wafer from between the pages of his prayer book. He presses it into your hand, squeezes your shoulder then walks off with his followers, the guard keeping careful watch.
    ~ wafer_chip = 1
    + [{continue}] -> panorama

= bob
# CLEAR 
Bob clinks a champagne glass with Helen. A robotic arm attached to a computer (laura) holds a glass. Arm is mounted on a machine, looking like a small Mars rover. Bob is reunited with his wife Helen and the two couldn’t be more overjoyed. The two of them clink glasses with a robotic arm that holds a glass as well. Bob squeezes Helen tight then speaks. “Laura. I’m so glad all this… office drama… is over. We cannot thank you enough.”
Laura’s voice, tinny and thin comes from a speaker. “You owe me nothing. All I did was watch the human variables and do what I could. Just like anyone.”
Bob chuckles into his drink, “Like anyone…”
Helen presses into Bob’s side, enjoying the warmth of her husband after the cold senseless feel of an android body. “I wish we could have stopped them earlier.”
Laura’s camera focuses on them. “Live and learn… live and learn…”
    + [{continue}] -> panorama
    
= eliza_retro
# CLEAR
An agent pulls a sheet across a large mainframe computer system (Eliza)
With the return of Laura, Eliza has been sunset and confined to this computing unit. It’s too big to move without the right equipment or planning. So for the time being Eliza will remain here, disconnected from the network until it can be dissected, decompiled and analyzed. While the Inquisition may not have had the best programmers, they had more than a few tricks up their sleeves. It shouldn’t take Laura long to learn their secrets.
    + {wafer_chip} [Insert the wafer] -> chip
    + [{continue}] -> panorama

= chip
# CLEAR
You place the wafer on the computer’s sensor and Eliza speaks, “Here you go. Let me know if you need anything else, I’m here to serve!” Text scrolls across a nearby screen. It streams by quickly, but you skim the highlights.
# CLASS computer
The old man led the inquisition... the last from a distant future, to help, to fight, to stop…
A robotic arm appears from behind, grasping the wafer and cutting off the flow of information. Laura’s washed-out voice comes from a cheap speaker mounted on the machine. “Please let me handle any analysis of Eliza. The Inquisition may have lost their leader, but they are not done yet. They may have set traps, like this…” Laura holds the wafer close to an optical sensor, then lowers it to “look” at you accusingly...
    + [End game] -> outro

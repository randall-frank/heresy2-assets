/*
 * These are the globally addressable state variables.
 * Having these variables in the global space makes
 * them easier to access from the web page Javascript.
 * For example:
 *
 * story.variablesState["varname"]
 *
 * can be used to access the current VAR values defined here.
 *
 * One other note, the language supports the use of general
 * tags in comment lines:
 *
 * Pre-defined tags:
 *  # BACKGROUND: src
 *  # IMAGE: src     - an inline image
 *  # SBIMAGE: src   - a sidebar image
 *  # LINK: url
 *  # LINKOPEN: url
 *  # CLASS: classname  - text should use a specific css class
 *  # CLEAR
 *  # RESTART
 *  # AUDIOLOOP: src  - background audio
 *  # AUDIO: src      - one-shot audio
 *
 * see main.js for how these are handled.  However, any other
 * tags are legal as well (e.g. # HELLO: foobar) and the "step"
 * function in main.js can detect and respond to these while
 * generating the HTML blocks.
 *
 * Useful links to the ink language:
 *
 * https://github.com/sawradip/ink-cheat-sheet
 * https://docs.unfold.studio/user_guide/ink.html#part-5-advanced-state-tracking
 * https://github.com/inkle/ink/blob/master/Documentation/WritingWithInk.md
 *
 */

// the "next" text
VAR continue = "Proceed..."

// The name of the current "location" (usually set in the knot)
VAR location_name = ""

// The power cost of moving from one location to another
VAR location_change_cost = -1

// is non-zero if the path to the temple has been found
VAR temple_found = 0

// is non-zero if they helped the beggar at the temple
VAR helped_beggar = 0

// is non-zero if you spoke with the servant in the garden (who "vouches" for you).
VAR spoke_with_andrew = 0

// is non-zero if you won the fight in the temple cella
VAR won_cella_fight = 0

// if non-zero, Laura has pointed out the scales
VAR tip_scales = 0

// if non-zero you have bested the philosopher
VAR philosopher_win = 0

// variables used by combat() tunnel.  Set these first and call combat() to
// run a round of "combat"
VAR combat_health = 0.
VAR combat_attack = 0.
VAR combat_defence = 50.
// damage = attack*(ratio/(ratio+defence))
VAR combat_ratio = 100.

// variable used by the "combination lock" (# COMBO)
// This variable contains the initial state and
// the GUI sets story.variablesState.combo_value
// to the current combination state.
VAR combo_value = 0
// If set to 1, use the set of symbols rather than numbers
VAR combo_symbols = 0

// debug can be set to any value via '?dev=x'
// This enables shortcuts {debug} that speed development
VAR debug = 0

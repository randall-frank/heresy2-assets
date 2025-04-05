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
 *  # LINK: url
 *  # LINKOPEN: url
 *  # CLASS: classname
 *  # CLEAR
 *  # RESTART
 *  # AUDIOLOOP: src
 *  # AUDIO: src
 *
 * see main.js for how these are handled.  However, any other
 * tags are legal as well (e.g. # HELLO: foobar) and the "step"
 * function in main.js can detect and respond to these while
 * generating the HTML blocks.
 *
 */

// the "next" text
VAR continue = "Proceed..."

// The names of all of the items
VAR item_names = "tattooed,padded_cell_key,lcd_display"

// From the workshop location
VAR tattooed = 0
VAR padded_cell_key = 0
VAR lcd_display = 0

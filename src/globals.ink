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
 */

// the "next" text
VAR continue = "Proceed..."

// The names of all of the items
VAR item_names = "tattooed,padded_cell_key,lcd_display"


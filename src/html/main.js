
function refresh_inventory(story, elem) {
    for( const [name, value] of Object.entries(storyItems['items'])) {
        let item_elem = document.querySelector('#item_'+name);
        let visible = story.variablesState[name];
        if (visible) {
            // if the item has a hide_variable tag, we still might hide it
            if (value.hasOwnProperty('hide_variable')) {
                if (story.variablesState[value.hide_variable]) visible = 0;
            }
        }
        if (visible) {
            item_elem.style.display = "block";
        } else {
            item_elem.style.display = "none";
            if (item_elem.className === 'item_selected') {
                // Clear details innerHTML
                document.querySelector('#itemdetails').innerHTML = '';
            }
        }
    }
}

function inventory_select(e) {
    let selected_info = null;
    let selected_name = null;
    for( const [name, value] of Object.entries(storyItems['items'])) {
        let item_elem = document.querySelector('#item_'+name);
        if (item_elem === e.target) {
            item_elem.className = 'item_selected';
            selected_info = value;
            selected_name = name;
        } else {
            item_elem.className = '';
        }
    }
    let info = '';
    if (selected_info) {
        if (selected_info.hasOwnProperty('url')) {
            info += '<img src="' + selected_info.url + '">';
        }
        info += "<p>" + selected_info.description + combo_html(selected_name) + "</p>";
    }
    // set details innerHTML to info...
    document.querySelector('#itemdetails').innerHTML = info;
}

function build_inventory(story, elem) {
    // Build the inventory (item) section
    let item_list = "";
    for( const [name, value] of Object.entries(storyItems['items'])) {
        item_list += "<li id='item_" + name + "'>" + value.name + "</li>";
    }
    elem.innerHTML = "<ul id='inventory_list' style='padding-left: 10px;'>" + item_list + "</ul>";
    let el = document.querySelector('#inventory_list');
    el.addEventListener('click', inventory_select);
}

function build_status(story) {
    // Take the opportunity to update the location text
    let location = document.querySelector('#locationname');
    let text = story.variablesState["location_name"];
    if (text.length) {
        location.innerText = text;
        location.style.display = "block";
    } else {
        location.style.display = "none";
    }

    let statusinfo = document.querySelector('#statusinfo');
    let visible_count = 0;
    let inner = "";
    for( const [name, value] of Object.entries(storyItems['states'])) {
        // Get the state variable value
        let count = story.variablesState[name];
        // convert to display value
        let disp_count = count.toString();
        // add percent if requested
        if (value.hasOwnProperty('percent')) {
            if (value.percent) disp_count += "%";
        }
        // decide if this is visible
        let hide = value.hide;
        // if 2, base on the value of the count variable
        if (hide === 2) {
            // if hide_variable is set, use the value of that variable instead
            if (value.hasOwnProperty('hide_variable')) {
                count = story.variablesState[value.hide_variable];
            }
            // adjust hide based on count
            hide = 0;
            if (count === 0) hide = 1;
        }
        if (hide === 0) {
            inner += "<p style='padding-left: 10px;'>" + value.name + ": <b>" + disp_count + "</b></p>";
            visible_count += 1;
        }
    }
    statusinfo.innerHTML = inner;
    let section_div = document.querySelector('#statussection');
    if (visible_count) {
        section_div.style.display = "block";
    } else {
        section_div.style.display = "none";
    }
}

/* Symbol mode
0 fa-solid fa-crutch
1 fa-solid fa-bolt
2 fa-solid fa-scale-balanced
3 fa-regular fa-sun
4 fa-solid fa-fish
5 fa-regular fa-moon
6 fa-regular fa-star
7 fa-solid fa-wind
8 fa-regular fa-user
9 fa-regular fa-hourglass
*/
/* Alternatives
fa-solid fa-fire
fa-solid fa-tree
*/
var numeric_names = ["fa-solid fa-0", "fa-solid fa-1", "fa-solid fa-2",
    "fa-solid fa-3", "fa-solid fa-4", "fa-solid fa-5", "fa-solid fa-6",
    "fa-solid fa-7", "fa-solid fa-8", "fa-solid fa-9"];
    
var symbol_names = ["fa-solid fa-crutch", "fa-solid fa-bolt", "fa-solid fa-scale-balanced",
    "fa-regular fa-sun", "fa-solid fa-fish", "fa-regular fa-moon",
    "fa-regular fa-star", "fa-solid fa-wind", "fa-regular fa-user",
    "fa-regular fa-hourglass"];

function icon_digit_html(digit, symbols) {
    let cnames = numeric_names;
    if (symbols) {
        cnames = symbol_names;
    }
    return '<i class="' + cnames[digit] + '"></i>';
}

function combo_html(item_name) {
    let html = '';
    for( const [name, value] of Object.entries(storyItems['items'])) {
        if (item_name == name) {
            if (value.hasOwnProperty('code')) {
                let combo = theStory.variablesState[value.code];
                let symbol = false;
                if (value.hasOwnProperty('symbol')) symbol = true;
                let digit = combo % 10;
                combo = Math.trunc(combo / 10);
                html = icon_digit_html(digit, symbol) + html;
                digit = combo % 10;
                combo = Math.trunc(combo / 10);
                html = icon_digit_html(digit, symbol) + '&nbsp;' + html;
                digit = combo % 10;
                combo = Math.trunc(combo / 10);
                html = icon_digit_html(digit, symbol) + '&nbsp;' + html;
                digit = combo % 10;
                combo = Math.trunc(combo / 10);
                html = icon_digit_html(digit, symbol) + '&nbsp;' + html;
            }
        }
    }
    if (html.length) {
        html = "<p class='codetext'>" + html + "</p>";
    }
    return html;
}

function combo_lock_update_icons(story) {
    let cnames = numeric_names;
    if (story.variablesState.combo_symbols) {
        cnames = symbol_names;
    }
    let value = story.variablesState.combo_value;
    let digit = value % 10;
    value = Math.trunc(value / 10);
    let elem = document.querySelector('#digit3');
    elem.className = cnames[digit];
    digit = value % 10;
    value = Math.trunc(value / 10);
    elem = document.querySelector('#digit2');
    elem.className = cnames[digit];
    digit = value % 10;
    value = Math.trunc(value / 10);
    elem = document.querySelector('#digit1');
    elem.className = cnames[digit];
    digit = value % 10;
    elem = document.querySelector('#digit0');
    elem.className = cnames[digit];
}

function insert_combo_lock(story, parent, combo_var_name) {
    let combo_div = document.createElement('div');
    combo_div.style.width = "100%";
    let s = '';
    let combination = story.variablesState[combo_var_name];
    if (story.variablesState.debug) {
        s += '<p>' + combination.toString() + '</p>';
    }
    s += `<table class="combo-holder">
<tr>
<td>
<table class="combo">
  <tr>
    <th><button id="up0"><i class="fa-solid fa-chevron-up"></i></button></th>
  </tr>
  <tr>
    <td><i id="digit0" class="fa-solid fa-0"></i></td>
  </tr>
  <tr>
    <th><button id="down0"><i class="fa-solid fa-chevron-down"></i></button></th>
  </tr>
</table>
</td>
<td>
<table class="combo">
  <tr>
    <th><button id="up1"><i class="fa-solid fa-chevron-up"></i></button></th>
  </tr>
  <tr>
    <td><i id="digit1" class="fa-solid fa-crutch"></i></td>
  </tr>
  <tr>
    <th><button id="down1"><i class="fa-solid fa-chevron-down"></i></button></th>
  </tr>
</table>
</td>
<td>
<table class="combo">
  <tr>
    <th><button id="up2"><i class="fa-solid fa-chevron-up"></i></button></th>
  </tr>
  <tr>
    <td><i id="digit2" class="fa-solid fa-scale-balanced"></i></td>
  </tr>
  <tr>
    <th><button id="down2"><i class="fa-solid fa-chevron-down"></i></button></th>
  </tr>
</table>
</td>
<td>
<table class="combo">
  <tr>
    <th><button id="up3"><i class="fa-solid fa-chevron-up"></i></button></th>
  </tr>
  <tr>
    <td><i id="digit3" class="fa-solid fa-1"></i></td>
  </tr>
  <tr>
    <th><button id="down3"><i class="fa-solid fa-chevron-down"></i></button></th>
  </tr>
</table>
</tr>
</table>`;
    combo_div.innerHTML = s;
    parent.appendChild(combo_div);
    combo_lock_update_icons(story);
    for (let i = 0; i < 4; i++) {
        let elem = document.querySelector("#up" + i.toString());
        const up_callback = combo_lock_button.bind(null, i, 1);
        elem.addEventListener("click", up_callback);
        elem = document.querySelector("#down" + i.toString());
        const down_callback = combo_lock_button.bind(null, i, -1);
        elem.addEventListener("click", down_callback);
    }
    return combo_div;
}

function combo_lock_button(i, direction) {
    let value = theStory.variablesState.combo_value;
    let digits = value.toString().split("").map(Number);
    while (digits.length < 4) digits.unshift(0);
    digits[i] += direction;
    if (digits[i] < 0) digits[i] += 10;
    if (digits[i] > 9) digits[i] -= 10;
    // rebuild the number
    value = digits[0];
    for(let i = 1; i<4; i++) {
        value = value * 10 + digits[i];
    }
    theStory.variablesState.combo_value = value;
    combo_lock_update_icons(theStory);
}

/**********************  Story starts here *******************/

(function(storyContent) {

    // Create ink story from the content using inkjs
    var story = new inkjs.Story(storyContent);
    theStory = story;

    var savePoint = "";

    let savedTheme;
    let globalTagTheme;

    // Global tags - those at the top of the ink file
    // We support:
    //  # theme: dark
    //  # author: Your Name
    var globalTags = story.globalTags;
    if( globalTags ) {
        for(var i=0; i<story.globalTags.length; i++) {
            var globalTag = story.globalTags[i];
            var splitTag = splitPropertyTag(globalTag);

            // THEME: dark
            if( splitTag && splitTag.property == "theme" ) {
                globalTagTheme = splitTag.val;
            }

            // author: Your Name
            else if( splitTag && splitTag.property == "author" ) {
                var byline = document.querySelector('.byline');
                byline.innerHTML = splitTag.val;
            }
        }
    }

    var imageContainer = document.querySelector('#images');
    var sidebarContainer = document.querySelector('#sidebar');
    var inventoryContainer = document.querySelector('#inventory');
    var storyContainer = document.querySelector('#story');
    var outerScrollContainer = document.querySelector('.outerContainer');

    // page features setup
    setupTheme(globalTagTheme);
    var hasSave = loadSavePoint();
    setupButtons(hasSave);
    build_inventory(story, inventoryContainer);
    build_status(story);

    // Check for "dev" mode
    const urlParams = new URLSearchParams(window.location.search);
    const dev_mode = Number(urlParams.get('dev'));
    if (!isNaN(dev_mode)) {
        story.variablesState.debug = dev_mode;
    }

    // Set initial save point
    savePoint = story.state.toJson();

    // Kick off the start of the story!
    continueStory(true);

    // Main story processing function. Each time this is called it generates
    // all the next content up as far as the next set of choices.
    function continueStory(firstTime) {

        var paragraphIndex = 0;
        var delay = 0.0;

        // Don't over-scroll past new content
        var previousBottomEdge = firstTime ? 0 : contentBottomEdgeY();

        // Clear the image sidebar
        imageContainer.innerHTML = '';

        // Placeholder for in injected raw HTML
        var HTML_text = '';
        
        // IMAGEHEIGHT specification for the IMAGE option
        var IMAGE_height = null;

        // Generate story text - loop through available content
        while(story.canContinue) {

            // Get ink to generate the next paragraph
            var paragraphText = story.Continue();
            var tags = story.currentTags;

            // Any special tags included with this line
            var customClasses = [];
            for(var i=0; i<tags.length; i++) {
                var tag = tags[i];

                // Detect tags of the form "X: Y". Currently used for IMAGE and CLASS but could be
                // customised to be used for other things too.
                var splitTag = splitPropertyTag(tag);
				splitTag.property = splitTag.property.toUpperCase();

                // AUDIO: src
                if( splitTag && splitTag.property == "AUDIO" ) {
                  if('audio' in this) {
                    this.audio.pause();
                    this.audio.removeAttribute('src');
                    this.audio.load();
                  }
                  this.audio = new Audio(splitTag.val);
                  this.audio.volume = 0.3;
                  this.audio.play();
                }

                // AUDIOLOOP: src
                else if( splitTag && splitTag.property == "AUDIOLOOP" ) {
                  if('audioLoop' in this) {
                    this.audioLoop.pause();
                    this.audioLoop.removeAttribute('src');
                    this.audioLoop.load();
                  }
                  this.audioLoop = new Audio(splitTag.val);
                  this.audioLoop.volume = 0.1;
                  this.audioLoop.loop = true;
                  this.audioLoop.play();
                }

                // SBIMAGE: src
                if( splitTag && splitTag.property == "SBIMAGE" ) {
                    var imageElement = document.createElement('img');
                    imageElement.src = splitTag.val;
                    imageContainer.appendChild(imageElement);

                    imageElement.onload = () => {
                        console.log(`scrollingto ${previousBottomEdge}`)
                        scrollDown(previousBottomEdge)
                    }

                    showAfter(delay, imageElement);
                    delay += 200.0;
                }
                // IMAGEHEIGHT: height   (inline image height)
                else if (splitTag && splitTag.property == "IMAGEHEIGHT") {
                    IMAGE_height = splitTag.val;
                }
                // IMAGE: src   (inline image)
                else if( splitTag && splitTag.property == "IMAGE" ) {
                    var imageElement = document.createElement('img');
                    imageElement.src = splitTag.val;
                    if (IMAGE_height != null) {
                        imageElement.style.height = IMAGE_height;
                        imageElement.style.width = 'auto';
                        IMAGE_height = null;
                    }
                    storyContainer.appendChild(imageElement);

                    imageElement.onload = () => {
                        console.log(`scrollingto ${previousBottomEdge}`)
                        scrollDown(previousBottomEdge)
                    }

                    showAfter(delay, imageElement);
                    delay += 200.0;
                }

                // COMBO: code_*name  (inline combination lock)
                else if( splitTag && splitTag.property == "COMBO" ) {
                    let elem = insert_combo_lock(story, storyContainer, splitTag.val);
                    showAfter(delay, elem);
                    delay += 200.0;
                }

                // LINK: url
                else if( splitTag && splitTag.property == "LINK" ) {
                    window.location.href = splitTag.val;
                }

                // LINKOPEN: url
                else if( splitTag && splitTag.property == "LINKOPEN" ) {
                    window.open(splitTag.val);
                }

                // HTML: text
                else if( splitTag && splitTag.property == "HTML" ) {
                    HTML_text = splitTag.val.replace("<ss>", "//");
                }

                // BACKGROUND: src
                else if( splitTag && splitTag.property == "BACKGROUND" ) {
                    outerScrollContainer.style.backgroundImage = 'url('+splitTag.val+')';
                }

                // CLASS: className
                else if( splitTag && splitTag.property == "CLASS" ) {
                    customClasses.push(splitTag.val);
                }

                // CLEAR - removes all existing content.
                // RESTART - clears everything and restarts the story from the beginning
                else if( tag == "CLEAR" || tag == "RESTART" ) {
                    removeAll("p");
                    removeAll("img");
                    // Removes the "# COMBO" block
                    removeAll("div");

                    // Comment out this line if you want to leave the header visible when clearing
                    setVisible(".header", false);

                    if( tag == "RESTART" ) {
                        restart();
                        return;
                    }
                }
            }

            // Update the inventory items
            refresh_inventory(story, inventoryContainer);
            // Update the status
            build_status(story);
		
            // Check if paragraphText is empty
            if (paragraphText.trim().length === 0) {
                continue; // Skip empty paragraphs
		    }

            // Create paragraph element (initially hidden)
            var paragraphElement = document.createElement('p');
            // Inject # HTML tag into the paragraph text verbatim
            paragraphText = paragraphText.replace("HTML", HTML_text);
            HTML_text = '';
            // fill in the <p> text
            paragraphElement.innerHTML = paragraphText;
            storyContainer.appendChild(paragraphElement);

            // Add any custom classes derived from ink tags
            for(var i=0; i<customClasses.length; i++)
                paragraphElement.classList.add(customClasses[i]);

            // Fade in paragraph after a short delay
            showAfter(delay, paragraphElement);
            delay += 200.0;
        }

        // Create HTML choices from ink choices
        story.currentChoices.forEach(function(choice) {

            // Create paragraph with anchor element
            var choiceTags = choice.tags;
            var customClasses = [];
            var isClickable = true;
            for(var i=0; i<choiceTags.length; i++) {
                var choiceTag = choiceTags[i];
                var splitTag = splitPropertyTag(choiceTag);
				splitTag.property = splitTag.property.toUpperCase();

                if(choiceTag.toUpperCase() == "UNCLICKABLE"){
                    isClickable = false
                }

                if( splitTag && splitTag.property == "CLASS" ) {
                    customClasses.push(splitTag.val);
                }

            }

            var choiceParagraphElement = document.createElement('p');
            choiceParagraphElement.classList.add("choice");

            for(var i=0; i<customClasses.length; i++)
                choiceParagraphElement.classList.add(customClasses[i]);

            if(isClickable){
                choiceParagraphElement.innerHTML = `<a href='#'>${choice.text}</a>`
            }else{
                choiceParagraphElement.innerHTML = `<span class='unclickable'>${choice.text}</span>`
            }
            storyContainer.appendChild(choiceParagraphElement);

            // Fade choice in after a short delay
            showAfter(delay, choiceParagraphElement);
            delay += 200.0;

            // Click on choice
            if(isClickable){
                var choiceAnchorEl = choiceParagraphElement.querySelectorAll("a")[0];
                choiceAnchorEl.addEventListener("click", function(event) {

                    // Don't follow <a> link
                    event.preventDefault();

                    // Extend height to fit
                    // We do this manually so that removing elements and creating new ones doesn't
                    // cause the height (and therefore scroll) to jump backwards temporarily.
                    storyContainer.style.height = contentBottomEdgeY()+"px";

                    // Remove all existing choices
                    removeAll(".choice");

                    // Tell the story where to go next
                    story.ChooseChoiceIndex(choice.index);

                    // This is where the save button will save from
                    savePoint = story.state.toJson();

                    // Aaand loop
                    continueStory();
                });
            }
        });

		// Unset storyContainer's height, allowing it to resize itself
		storyContainer.style.height = "";

        if( !firstTime )
            scrollDown(previousBottomEdge);

        // Check for "end game"
        // Other async "end game" conditions...
    }

    function restart() {
        story.ResetState();

        setVisible(".header", true);

        // set save point to here
        savePoint = story.state.toJson();

        continueStory(true);

        outerScrollContainer.scrollTo(0, 0);
    }

    // -----------------------------------
    // Various Helper functions
    // -----------------------------------

    // Detects whether the user accepts animations
    function isAnimationEnabled() {
        return window.matchMedia('(prefers-reduced-motion: no-preference)').matches;
    }

    // Fades in an element after a specified delay
    function showAfter(delay, el) {
        if( isAnimationEnabled() ) {
            el.classList.add("hide");
            setTimeout(function() { el.classList.remove("hide") }, delay);
        } else {
            // If the user doesn't want animations, show immediately
            el.classList.remove("hide");
        }
    }

    // Scrolls the page down, but no further than the bottom edge of what you could
    // see previously, so it doesn't go too far.
    function scrollDown(previousBottomEdge) {
        // If the user doesn't want animations, let them scroll manually
        if ( !isAnimationEnabled() ) {
            return;
        }

        // Line up top of screen with the bottom of where the previous content ended
        var target = previousBottomEdge;

        // Can't go further than the very bottom of the page
        var limit = outerScrollContainer.scrollHeight - outerScrollContainer.clientHeight;
        if( target > limit ) target = limit;

        var start = outerScrollContainer.scrollTop;

        var dist = target - start;
        var duration = 300 + 300*dist/100;
        var startTime = null;
        function step(time) {
            if( startTime == null ) startTime = time;
            var t = (time-startTime) / duration;
            var lerp = 3*t*t - 2*t*t*t; // ease in/out
            outerScrollContainer.scrollTo(0, (1.0-lerp)*start + lerp*target);
            if( t < 1 ) requestAnimationFrame(step);
        }
        requestAnimationFrame(step);
    }

    // The Y coordinate of the bottom end of all the story content, used
    // for growing the container, and deciding how far to scroll.
    function contentBottomEdgeY() {
        var bottomElement = storyContainer.lastElementChild;
        return bottomElement ? bottomElement.offsetTop + bottomElement.offsetHeight : 0;
    }

    // Remove all elements that match the given selector. Used for removing choices after
    // you've picked one, as well as for the CLEAR and RESTART tags.
    function removeAll(selector)
    {
        var allElements = storyContainer.querySelectorAll(selector);
        for(var i=0; i<allElements.length; i++) {
            var el = allElements[i];
            el.parentNode.removeChild(el);
        }
    }

    // Used for hiding and showing the header when you CLEAR or RESTART the story respectively.
    function setVisible(selector, visible)
    {
        var allElements = storyContainer.querySelectorAll(selector);
        for(var i=0; i<allElements.length; i++) {
            var el = allElements[i];
            if( !visible )
                el.classList.add("invisible");
            else
                el.classList.remove("invisible");
        }
    }

    // Helper for parsing out tags of the form:
    //  # PROPERTY: value
    // e.g. IMAGE: source path
    function splitPropertyTag(tag) {
        var propertySplitIdx = tag.indexOf(":");
        if( propertySplitIdx != null ) {
            var property = tag.substr(0, propertySplitIdx).trim();
            var val = tag.substr(propertySplitIdx+1).trim();
            return {
                property: property,
                val: val
            };
        }

        return null;
    }

    // Loads save state if exists in the browser memory
    function loadSavePoint() {

        try {
            let savedState = window.localStorage.getItem('save-state');
            if (savedState) {
                story.state.LoadJson(savedState);
                return true;
            }
        } catch (e) {
            console.debug("Couldn't load save state");
        }
        return false;
    }

    // Detects which theme (light or dark) to use
    function setupTheme(globalTagTheme) {

        // load theme from browser memory
        var savedTheme;
        try {
            savedTheme = window.localStorage.getItem('theme');
        } catch (e) {
            console.debug("Couldn't load saved theme");
        }

        // Check whether the OS/browser is configured for dark mode
        var browserDark = window.matchMedia("(prefers-color-scheme: dark)").matches;

        if (savedTheme === "dark"
            || (savedTheme == undefined && globalTagTheme === "dark")
            || (savedTheme == undefined && globalTagTheme == undefined && browserDark))
            document.body.classList.add("dark");
    }

    // Used to hook up the functionality for global functionality buttons
    function setupButtons(hasSave) {

        let rewindEl = document.getElementById("rewind");
        if (rewindEl) rewindEl.addEventListener("click", function(event) {
            removeAll("p");
            removeAll("img");
            setVisible(".header", false);
            restart();
        });

        let saveEl = document.getElementById("save");
        if (saveEl) saveEl.addEventListener("click", function(event) {
            try {
                window.localStorage.setItem('save-state', savePoint);
                document.getElementById("reload").removeAttribute("disabled");
                window.localStorage.setItem('theme', document.body.classList.contains("dark") ? "dark" : "");
            } catch (e) {
                console.warn("Couldn't save state");
            }

        });

        let reloadEl = document.getElementById("reload");
        if (!hasSave) {
            reloadEl.setAttribute("disabled", "disabled");
        }
        reloadEl.addEventListener("click", function(event) {
            if (reloadEl.getAttribute("disabled"))
                return;

            removeAll("p");
            removeAll("img");
            try {
                let savedState = window.localStorage.getItem('save-state');
                if (savedState) story.state.LoadJson(savedState);
            } catch (e) {
                console.debug("Couldn't load save state");
            }
            continueStory(true);
        });

        let themeSwitchEl = document.getElementById("theme-switch");
        if (themeSwitchEl) themeSwitchEl.addEventListener("click", function(event) {
            document.body.classList.add("switched");
            document.body.classList.toggle("dark");
        });
    }

})(storyContent);

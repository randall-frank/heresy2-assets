/**** Check for debug mode ****/
function checkDebugMode() {
    // Check if the URL has a 'dev' parameter
    const urlParams = new URLSearchParams(window.location.search);
    const dev_mode = Number(urlParams.get('dev'));
    if (!isNaN(dev_mode)) return dev_mode;
    return 0; // Default to 0 if 'dev' parameter is not present or invalid
}

function getQueryValue(name) {
    // Check if the URL has a named parameter
    const urlParams = new URLSearchParams(window.location.search);
    if (!urlParams.has(name)) {
        return ""; // Return empty string if the parameter is not present
    }
    return urlParams.get(name);
}

function clampValue(value, minValue, maxValue) {
  return Math.min(Math.max(value, minValue), maxValue);
}

/***** Audio Utilities *****/

// Globals from item_globals.js
// let current_volume = 30;
// let last_volume = 30;
// var audio = null;
// var audioLoop = null;
// Note: slider volume (current_volume and last_volume) is [0-100]

// Background audio loops.  To avoid loop clicking, we use the web audio API for it
let audioContext = new (window.AudioContext || window.webkitAudioContext)();
let audioBuffer; // the current mp3/m4a audio buffer
let gainNode; // volume control for the audio loop
let source;  // The audio source node for the background music

function stopBackgroundAudio() {
    if (source) {
        source.stop();
        source.disconnect();
        source = null;
    }
    if (gainNode) {
        gainNode.disconnect();
        gainNode = null;
    }
    if (audioContext) {
        audioContext.close();
        audioContext = new (window.AudioContext || window.webkitAudioContext)(); // Recreate the context
    }
}
function updateBackgroundAudioVolume() {
    if (source) {
        const gainValue = (parseFloat(current_volume) * 0.01) * 0.5 * get_audioloop_scale();
        gainNode.gain.value = gainValue;
    }
}

async function startBackgroundAudio(url) {
    stopBackgroundAudio(); // Stop any currently playing audio
    if (url == "") return; // No URL provided, nothing to play
    // Clean the URL (from a full URL to the relative audio/{filename.xyz})
    // This works around cases where a saved files might have a full URL (e.g., file://...)
    let cleaned_url = "audio/" + url.split('audio/').pop();
    const response = await fetch(cleaned_url);
    const arrayBuffer = await response.arrayBuffer();
    audioBuffer = await audioContext.decodeAudioData(arrayBuffer);
    source = audioContext.createBufferSource();  // Create a new audio source
    source.buffer = audioBuffer;
    source.loop = true; // This is the crucial part for looping
    // We can change the volume of this source using a gain node
    gainNode = audioContext.createGain();
    source.connect(gainNode);
    gainNode.connect(audioContext.destination);
    // Set the initial volume (background audio is at 30% of the slider volume)
    const gainValue = (parseFloat(current_volume) * 0.01) * 0.3 * get_audioloop_scale();
    gainNode.gain.value = gainValue;
    // Start playing the audio
    source.start();
}

// update the volume of all sounds and record the change in a cookie
function audio_volume_update() {
    updateBackgroundAudioVolume();
    /*
    if (audioLoop !== null) {
        audioLoop.volume = (parseFloat(current_volume) * 0.01) * 0.3 * get_audioloop_scale();
    }
    */
    if (audio !== null) {
        let volume = (parseFloat(current_volume) * 0.01) * get_audio_scale();
        volume = clampValue(volume, 0.0, 1.0); // Ensure volume is within [0, 1]
        audio.volume = volume;
    }
    setCookie("heresy_audio_volume", String(current_volume), 30);
}

// The UI changed
function volume_update(el){
    if (el.target) el = el.target;
    const off = document.querySelector('#volume_off');
    const med = document.querySelector('#volume_med');
    const high = document.querySelector('#volume_high');
    if (el.value == 0) {
        off.style.display = 'block';
        med.style.display = 'none';
        high.style.display = 'none';
    } else if (el.value < 50) {
        off.style.display = 'none';
        med.style.display = 'block';
        high.style.display = 'none';
    } else {
        off.style.display = 'none';
        med.style.display = 'none';
        high.style.display = 'block';
    }
    current_volume = el.value;
    audio_volume_update();
}

// Clicking on the volume icons
function volume_mute() {
    const slider = document.querySelector('#volume_slider');
    if(slider.value > 0) {
        last_volume = slider.value;
        slider.value = 0;
        volume_update(slider);
    } else {
        slider.value = last_volume;
        volume_update(slider);
    }
}

// Start with a potentially saved volume from a cookie
let temp_volume = getCookie("heresy_audio_volume");
if (temp_volume.length) {
    current_volume = temp_volume
    document.querySelector('#volume_slider').value = current_volume;
}
volume_update(document.querySelector('#volume_slider'));
// hook up the interaction elements
document.querySelector('#volume_slider').addEventListener('input', volume_update);
document.querySelector('#volume_off').addEventListener('click', volume_mute);
document.querySelector('#volume_med').addEventListener('click', volume_mute);
document.querySelector('#volume_high').addEventListener('click', volume_mute);


let audioSrcURL = "";
let audioLoopSrcURL = "";
let audioScale = 1.0; // Default scale multiplier for audio volume
let audioLoopScale = 1.0; // Default scale multiplier for audio loop volume

// simpler, higher-level interface used by main.js
function get_audio_source() {
    return audioSrcURL;
}
function get_audioloop_source() {
    return audioLoopSrcURL;
}
function get_audio_scale() {
    return audioScale;
}
function get_audioloop_scale() {
    return audioLoopScale;
}
function set_audio_source(src, volume_scale = 1.0) {
    audioSrcURL = src;
    audioScale = volume_scale;
    if(audio !== null) {
        audio.pause();
        audio.removeAttribute('src');
        audio.load();
    }
    audio = new Audio(src);
    let volume = (parseFloat(current_volume) * 0.01) * get_audio_scale();
    volume = clampValue(volume, 0.0, 1.0); // Ensure volume is within [0, 1]
    audio.volume = volume;
    audio.play();
}

function set_audioloop_source(src, volume_scale = 1.0) {
    audioLoopSrcURL = src;
    audioLoopScale = volume_scale;
    startBackgroundAudio(src);
    /*
    if (audioLoop !== null) {
        audioLoop.pause();
        audioLoop.removeAttribute('src');
        audioLoop.load();
                        
    }
    audioLoop = new Audio(src);
    audioLoop.volume = (parseFloat(current_volume) * 0.01) * 0.5 * get_audioloop_scale();
    audioLoop.loop = true;
    audioLoop.play();
    */
}

// Scaling factor for audio files
// This is used to adjust the volume of audio files based on their RMS levels
const audioTable = {
    "agora.mp3": 1.8, // 2.5080528256600267,
    "alarm.mp3": 0.9677960382716665,
    "ascension.mp3": 1.0522622850444774,
    "base.mp3": 2.050223882618732,
    "computer.mp3": 1.113647869258125,
    "computer_room.mp3": 2.1318255921133598,
    "control.mp3": 0.8235094237036732,
    "debrief.mp3": 3.8, // 2.1174217776383304,
    "decode.mp3": 2.320135960111768,
    "delphi.mp3": 0.8, // 0.5182181814735892,
    "door.mp3": 1.229592142660205,
    "door_locked.mp3": 2.3364377868888697,
    "door_unlock.mp3": 2.033594200109642,
    "endgame.mp3": 1.1458671217997978,
    "error.mp3": 0.42301043352356504,
    "fitting_scanner.mp3": 1.8138537345638406,
    "garden.mp3": 3.0, // 11.603948163612854,
    "hypermarket.mp3": 1.0006465349088194,
    "modem.mp3": 0.978625294299687,
    "normal.mp3": 1.4231723844573656,
    "office.mp3": 1.8389518565355658,
    "positive.mp3": 1.1858318123601832,
    "river.mp3": 5.5, // 6.130947271173782,
    "shock.mp3": 0.49520049625939244,
    "stonemason.mp3": 12.222129921371494,
    "temple.mp3": 2.8, // 3.4743481983806923,
    "transport.mp3": 0.5388959176793404,
    "workshop.mp3": 1.579235269326277
};

function split_audio_name(name) {
    // The URL can be in the form "audio/filename.mp3" or "audio/filename.mp3 1.5"
    // We want to extract the base name and the scale factor if present.  If not
    // present, we assume a scale factor of 1.0.
    let scale = 1.0;
    const parts = name.split(' ');
    if (parts.length > 1 && !isNaN(parts[parts.length - 1])) {
        scale = parseFloat(parts.pop());
    }
    let use_table = getQueryValue('audio_table'); // Check if there's an audio_table query parameter
    if (use_table) {
        if (Number(use_table) === 1) {
            // Look the mp3 name up in the audio table and use that scaling factor
            const index = parts[0].lastIndexOf('/');
            if (index !== -1) { 
                const filename = parts[0].substring(index + 1); // Get the filename only
                if (audioTable.hasOwnProperty(filename)) {
                    scale = audioTable[filename];
                }
            }
        }
    }
    return {
        name: parts[0],
        scale: scale
    };
}


/***** Color Utilities *****/
/**
 * Interpolate between two hex colors in HSL space.
 * @param {string} color1 - The first color in hex format (e.g., "#ff0000").
 * @param {string} color2 - The second color in hex format (e.g., "#0000ff").
 * @param {number} t - The interpolation factor (0.0 to 1.0).
 * @returns {string} - The interpolated color in hex format.
 */
function interpolateHSL(color1, color2, t) {
    const hsl1 = rgbToHslObj(hexToRgb(color1));
    const hsl2 = rgbToHslObj(hexToRgb(color2));

    // Interpolate hue (circular interpolation)
    let dh = hsl2.h - hsl1.h;
    if (Math.abs(dh) > 180) {
        dh -= Math.sign(dh) * 360;
    }
    const h = (hsl1.h + t * dh + 360) % 360;
    const s = hsl1.s + t * (hsl2.s - hsl1.s);
    const l = hsl1.l + t * (hsl2.l - hsl1.l);

    const rgb = hslToRgbObj({ h, s, l });
    return rgbToHex(rgb.r, rgb.g, rgb.b);
}

// Convert RGB object to HSL object
function rgbToHslObj({ r, g, b }) {
    r /= 255; g /= 255; b /= 255;
    const max = Math.max(r, g, b), min = Math.min(r, g, b);
    let h, s, l = (max + min) / 2;

    if (max === min) {
        h = s = 0;
    } else {
        const d = max - min;
        s = l > 0.5 ? d / (2 - max - min) : d / (max + min);
        switch (max) {
            case r: h = ((g - b) / d + (g < b ? 6 : 0)); break;
            case g: h = ((b - r) / d + 2); break;
            case b: h = ((r - g) / d + 4); break;
        }
        h *= 60;
    }
    return { h, s, l };
}

// Convert HSL object to RGB object
function hslToRgbObj({ h, s, l }) {
    h /= 360;
    let r, g, b;
    if (s === 0) {
        r = g = b = l;
    } else {
        const hue2rgb = (p, q, t) => {
            if (t < 0) t += 1;
            if (t > 1) t -= 1;
            if (t < 1 / 6) return p + (q - p) * 6 * t;
            if (t < 1 / 2) return q;
            if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
            return p;
        };
        const q = l < 0.5 ? l * (1 + s) : l + s - l * s;
        const p = 2 * l - q;
        r = hue2rgb(p, q, h + 1 / 3);
        g = hue2rgb(p, q, h);
        b = hue2rgb(p, q, h - 1 / 3);
    }
    return {
        r: Math.round(r * 255),
        g: Math.round(g * 255),
        b: Math.round(b * 255)
    };
}

/**
 * Interpolate between two colors in sRGB space.
 * @param {string} color1 - The first color in hex format (e.g., "#ff0000").
 * @param {string} color2 - The second color in hex format (e.g., "#0000ff").
 * @param {number} t - The interpolation factor (0.0 to 1.0).
 * @returns {string} - The interpolated color in hex format.
 */
function interpolateSRGB(color1, color2, t) {
  // Parse the hex colors into RGB components
  const c1 = hexToRgb(color1);
  const c2 = hexToRgb(color2);

  // Linearly interpolate each component
  const r = Math.round(c1.r + t * (c2.r - c1.r));
  const g = Math.round(c1.g + t * (c2.g - c1.g));
  const b = Math.round(c1.b + t * (c2.b - c1.b));

  // Convert back to hex format
  return rgbToHex(r, g, b);
}

// Helper function to convert hex to RGB
function hexToRgb(hex) {
  const bigint = parseInt(hex.slice(1), 16);
  return {
    r: (bigint >> 16) & 255,
    g: (bigint >> 8) & 255,
    b: bigint & 255,
  };
}

// Helper function to convert RGB to hex
function rgbToHex(r, g, b) {
  return `#${((1 << 24) + (r << 16) + (g << 8) + b).toString(16).slice(1)}`;
}

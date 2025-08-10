[![CC BY 4.0][cc-by-shield]][cc-by]

[Heresy]: http://heresy.mrtrashcan.com
[Ink]: https://github.com/inkle/ink/tree/master
[Inklecate]: https://github.com/inkle/ink/releases

# Heresy II: Of What Mettle Gods?

Copyright (C) 2022-2025 Andrew Florance, Marina Galvagni and Randy Frank

[![CC BY 4.0][cc-by-image]][cc-by]

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://i.creativecommons.org/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg

Heresy II is officially a work in progress.  It was originally envisioned
as a T.I.M.E Stories follow-on to the [Heresy] fan expansion.  This version
of the Heresy II story attempts to map the originally envisioned story
to the [Ink] framework.

There is a build.py script that will generate and optionally host the
generated story.

## Requirements:

- Python 3.10 or higher for organizing the build and acting as a local web server.
- Inklecate CLI tool for building the story JSON representation.
- (Optional) Inky GUI tool for editing the story.  One can use Visual Studio Code as well.

## Building:

Start by creating a Python virtual environment and install all the necessary
dependencies:

```
pip install virtualenv
python -m virtualenv venv
./venv/Scripts/activate.ps1   # for Windows PowerShell, different for other shells
pip install -r requirements.txt
```

To build the web-based version of the story, the '[Inklecate]' compiler needs to be
available.  The `build.py` script will attempt to download the
compiler from github when building the story.   It can also be included in the 
search path on your system or one can set the environmental variable 
`HERESY2_INKLECATE` to the complete pathname of the executable.  
A Powershell example if you downloaded the CLI tools yourself:

```
$Env:HERESY2_INKLECATE = "E:\inklecate_windows\inklecate.exe"
& $Env:HERESY2_INKLECATE
Usage: inklecate <options> <ink file> ...
```

However, in most cases you can just run the command `python build.py fullbuild`
and the tools will be downloaded into the directory `ink_tools`.

One can use the `build.py` file to build and run the story:

```
python build.py fullbuild
INFO:heresy2_build:Story version: 0.5.6
INFO:heresy2_build:File 'ink_tools\inklecate_windows.zip' downloaded successfully from 'https://github.com/inkle/ink/releases/download/v.1.2.0/inklecate_windows.zip'
INFO:heresy2_build:All files extracted from 'ink_tools\inklecate_windows.zip' to 'ink_tools'.
INFO:heresy2_build:{"compile-success": true}
{"issues":[]}{"export-complete": true}

INFO:heresy2_build:Operation complete

python build.py serve  --browse
Serving story:  http://127.0.0.1:9000
```

At this point, a browser tab will be opened, pointing to: ``http://127.0.0.1:9000`` 
in which the story may be played.

> Note, if one double-clicks on the `index.html` file in the `build` directory to 
view the story, the background sound will not work due to CORS issues as the background sound files are accessed
via fetch() calls.


Build.py has four options:

- clean
  - Remove the contents of the `build` directory.
- build
  - Regenerate `build/heresy2.js` (the story contents in Javascript form) from the
    current collection of `src/*.ink` files.
- fullbuild
  - rebuild the entire `build` directory. This does a `clean` followed by copying
    the contents of the `src/html` and `src/media` directories into `build`.  Finally,
    it does a `build` which regenerates the story Javascript file.
- serve [--port {portnumber}] [--browse]
  - This option starts a web server that serves up the contents of the `build`
    directory on the selected port.  This simulates an actual web deployment. The
    default port is 9000.  If `--browse` is specified, a web browser tab will be opened
    to view the story.


## Versioning:

The game has a semantic version number of the form: 'x.y.z'.  This is specified by the file 'version.txt'
in the source code.  This version number is also stored in game 'save' files, which are
basically a snapshot of the current ink engine instance, taken just before the current
knot is displayed.  Note: all fields can be multiple digits in length, so '0.3.12' is valid.

Any time there is a change to the overall state structure (e.g. a new knot/stich is 
added or a new item/variable is introduced), one much bump the x or y portion of the
semantic version.  The save file loader will allow files that differ only in the 'z' digits
to be loaded w/o warning.  So change like spelling, text revisions, etc should only update
the 'z' field to retain backward compatibility with old save files.

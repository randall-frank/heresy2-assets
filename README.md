[![CC-0 license](https://img.shields.io/badge/License-CC--0-blue.svg)](https://creativecommons.org/licenses/by-nd/4.0)

[Heresy]: http://heresy.mrtrashcan.com
[Ink]: https://github.com/inkle/ink/tree/master
[Inklecate]: https://github.com/inkle/ink/releases

# Heresy II: Of what mettle Gods?
Copyright (C) 2022-2025 Andrew Florance, Marina Galvagni and Randy Frank

Heresy II is officially a work in progress.  It was originally envisioned
as a T.I.M.E Stories follow-on to the [Heresy] fan expansion.  This version
of the Heresy II story attempts to map the originally envisioned story
to the [Ink] framework.

There is a build.py script that will generate and optionally host the
generated story.  

More information to come...

## Requirements:

- Python 3.10 or higher for organizing the build and acting as a local web server.

- Inklacate CLI tool for building the story JSON representation.

- (Optional) Inky GUI tool for editing the story.  One can use Visual Studio Code as well.

## Building:

To build the web-based version of the story, the '[Inklecate]' compiler needs to be
available.  It can be included in the system search path on your system or one can
set the environmental variable `HERESY2_INKLECATE` to the complete pathname of
the executable.  A Powershell example:

    > $Env:HERESY2_INKLECATE = "E:\hersey-ink\inklecate_windows\inklecate.exe"
    > & $Env:HERESY2_INKLECATE
    Usage: inklecate <options> <ink file> ...

Once this is set up, one can use the `build.py` file to build and run the story:

    > python build.py fullbuild
    Story version: 0.1.0
    Running compiler: ['E:\\hersey-ink\\inklecate_windows\\inklecate.exe', '-o', 'tmp.json', '-j', '-v', 'src\\heresy2.ink']

    {"compile-success": true}
    {"issues":[]}{"export-complete": true}

    > python build.py serve    
    Serving story:  http://127.0.0.1:9000

At this point, pointing a browser tab at: ``http://127.0.0.1:9000`` will view the 
story.  Alternatively, one can double-click on the `index.html` file in the `build`
directory to view the story (at present, the story is simply a collection of
static web files).

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
- serve [--port {portnumber}]
  - This option starts a web server that serves up the contents of the `build`
  directory on the selected port.  This simulates an actual web deployment. The
  default port is 9000.



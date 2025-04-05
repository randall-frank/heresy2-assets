import argparse
import datetime
from http.server import SimpleHTTPRequestHandler, HTTPServer
import logging
import os
import platform
import shutil
import subprocess


# Get the current version number
with open("version.txt", "r") as f:
    __version__ = f.read().strip()
    
"""
Command line build tool:

python build.py [operation] [options]

Operations:

clean
build
fullbuild
serve [--port port]

Note:

The 'inklecate' tool needs to be in the search path
and executable.  If it is not in the search path,
set HERESY2_INKLECATE to the complete pathname to the
executable.

"""


def build_story_js() -> None:
    """
    Rebuild the heresy2.js file in the build directory
    :return:
    """
    # Get the story version
    with open("version.txt", "rb") as fp:
        version = fp.read()
    print(f"Story version: {version.decode('ascii')}")
    copyright_year = str(datetime.datetime.now().year).encode("utf8")
    # Generate the .json format of the root ink file
    inklecate_path = "inklecate"
    if platform.system().lower().startswith("windows"):
        inklecate_path += ".exe"
    inklecate_path = os.environ.get("HERESY2_INKLECATE", inklecate_path)
    cmd = [inklecate_path, "-o", "tmp.json", "-j", "-v", os.path.join("src", "heresy2.ink")]
    print(f"Running compiler: {cmd}\n")
    result = subprocess.run(cmd, stdout=subprocess.PIPE)
    print(result.stdout.decode('utf-8'))
    # Build the Javascript from the JSON content
    with open("tmp.json", "rb") as fp:
        s = fp.read()
        s = b"var storyContent = " + s
        s = s.replace(b"STORY_VERSION", version)
        s = s.replace(b"STORY_YEAR", copyright_year)
        with open(os.path.join("build", "heresy2.js"), "wb") as output:
            output.write(s)


def clean() -> None:
    """
    Clear out the "build" directory
    :return:
    """
    try:
        shutil.rmtree("build")
        os.mkdir("build")
    except OSError:
        pass


def build() -> None:
    """
    Rebuild the "build" directory from scratch.
    :return:
    """
    # Complete rebuild
    clean()
    # Copy html and media directories
    shutil.copytree(os.path.join("src", "html"), "build", dirs_exist_ok=True)
    shutil.copytree(os.path.join("src", "media"), "build", dirs_exist_ok=True)
    # Build the story JSON file
    build_story_js()


def serve(port=9000) -> None:
    orig_cwd = os.getcwd()
    try:
        os.chdir("build")
        server_address = ('127.0.0.1', port)
        httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
        print(f"Serving story:  http://{server_address[0]}:{server_address[1]}")
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
    finally:
        os.chdir(orig_cwd)
    print("Server stopped.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "-V",
        "--version",
        action="version",
        version="%(prog)s {version}".format(version=__version__),
    )
    parser.add_argument("--verbose", action="store_true", default=False, help="Run in verbose mode")
    parser.add_argument("--logfile", help="Log file for verbose output", default="")
    
    cmd_parsers = parser.add_subparsers(help="Command", dest="cmd")
    cmd_parsers.required = True
    
    build_parser = cmd_parsers.add_parser("build", help="Regenerate the story .json file in the build directory")

    fullbuild_parser = cmd_parsers.add_parser("fullbuild", help="Rebuild the entire build directory contents")

    clean_parser = cmd_parsers.add_parser("clean", help="Remove all build directory contents")

    serve_parser = cmd_parsers.add_parser("serve", help="Server the build via http")
    serve_parser.add_argument("--port", type=int, default=9000, help="The port to use. Default: 9000")
    
    args = parser.parse_args()

    # Set up logging
    level = logging.WARNING
    if args.verbose:
        level = logging.INFO
    log = logging.getLogger("heresy2_build")
    logging.basicConfig(filename=args.logfile, level=level)
    log.info(f"Command line args: {args}")
    
    log.info("Operation complete")
    
    if args.cmd == "fullbuild":
        build()
    elif args.cmd == "build":
        build_story_js()
    elif args.cmd == "clean":
        clean()
    elif args.cmd == "serve":
        serve(port=args.port)

    exit(0)


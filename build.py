import argparse
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

build
serve [--port port]

Note:

The 'inklecate' tool needs to be in the search path
and executable.  If it is not in the search path,
set HERESY2_INKLECATE to the complete pathname to the
executable.

"""

def build():
    inklecate_path = "inklecate"
    if platform.system().lower().startswith("windows"):
        inklecate_path += ".exe"
    inklecate_path = os.environ.get("HERESY2_INKLECATE", inklecate_path)


def serve(port=8000):
    log.error("Unimplemented operation")
    

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
    
    build_parser = cmd_parsers.add_parser("build", help="Rebuild the build directory contents")

    serve_parser = cmd_parsers.add_parser("serve", help="Server the build via http")
    serve_parser.add_argument("--port", type=int, default=8000, help="The port to use. Default: 8000")
    
    args = parser.parse_args()

    # Set up logging
    level = logging.WARNING
    if args.verbose:
        level = logging.INFO
    log = logging.getLogger("heresy2_build")
    logging.basicConfig(filename=args.logfile, level=level)
    log.info(f"Command line args: {args}")
    
    log.info("Operation complete")
    
    if args.cmd  == "build":
        build()
    elif args.cmd == "serve":
        serve(port=args.port)

    exit(0)


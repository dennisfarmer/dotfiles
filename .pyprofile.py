#!/usr/bin/env python3
import os
import atexit
import readline

if "PYTHONHISTFILE" in os.environ:
    history = os.environ["PYTHONHISTFILE"]
else:
    history = os.path.join(os.path.expanduser("~", ".cache/history/.python_history"))

if not os.path.isdir(os.path.dirname(history)):
    os.mkdir(os.path.dirname(history))

try:
    readline.read_history_file(history)
except OSError:
    pass

def write_history():
    try:
        readline.write_history_file(history)
    except OSError:
        pass

atexit.register(write_history)

#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))
PREFS_PATH=$(find ~/.mozilla/firefox/ -name prefs.js)
echo "Appending to $PREFS_PATH"

cat $SCRIPT_DIR/prefs.js >> $PREFS_PATH

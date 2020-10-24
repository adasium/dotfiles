#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

dconf dump /org/cinnamon/ > $SCRIPT_DIR/cinnamon.dconf

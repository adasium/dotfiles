#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

ln -sfv $SCRIPT_DIR/config.py ~/.config/qtile/

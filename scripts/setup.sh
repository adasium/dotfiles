#!/usr/bin/env bash

SCRIPT_DIR=$(dirname $(realpath -s $0))

ln -sfv $SCRIPT_DIR/pulseaudio.sh ~/.local/bin/

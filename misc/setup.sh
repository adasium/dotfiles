#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

ln -sfv $SCRIPT_DIR/.pdbrc     ~/
ln -sfv $SCRIPT_DIR/.xbindkeys ~/
ln -sfv $SCRIPT_DIR/.xinitrc   ~/

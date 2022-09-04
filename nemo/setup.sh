#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

mkdir -p ~/.local/share/nemo/scripts/
ln -sfv $SCRIPT_DIR/pdfunite.py ~/.local/share/nemo/scripts/

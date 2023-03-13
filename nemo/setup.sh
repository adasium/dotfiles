#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

mkdir -p ~/.local/share/nemo/scripts/
for file in $SCRIPT_DIR/*.py; do
    ln -sfv $file ~/.local/share/nemo/scripts/
done

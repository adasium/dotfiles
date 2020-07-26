#!/usr/bin/env bash

EMACS_DIR="$HOME/.config/emacs"
EMACS_ACTIVATE_FILE="$EMACS_DIR/.venv/bin/activate"

if [ ! -d "$EMACS_DIR" ]; then
    echo "Creating directory: $EMACS_DIR"
    mkdir -p $EMACS_DIR
fi

if [ ! -f "$EMACS_ACTIVATE_FILE" ]; then
    if [ -x "$(command -v virtualenv)" ]; then
        pip3 install --user virtualenv
    fi
    echo "Creating virtualenv"
    virtualenv -p python3 "$EMACS_DIR/.venv"
fi

echo "Activating virtualenv"
source "$EMACS_DIR/.venv/bin/activate"
pip3 install -r requirements.txt --upgrade
ln -s -f $PWD/requirements.txt $EMACS_DIR

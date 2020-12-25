#!/usr/bin/env bash

EMACS_DIR="$HOME/.config/emacs"
EMACS_ACTIVATE_FILE="$EMACS_DIR/.venv/bin/activate"

if [ ! -d "$EMACS_DIR" ]; then
    echo "Creating directory: $EMACS_DIR"
    mkdir -p $EMACS_DIR
fi

if [ ! -f "$EMACS_ACTIVATE_FILE" ]; then
    if ! type virtualenv &> /dev/null; then
        echo "virtualenv not found in PATH"
        exit 1
    fi
    if ! type pip3 &> /dev/null; then
        echo "pip3 not found in PATH"
        exit 1
    fi

    pip3 install --user virtualenv
    echo "Creating virtualenv"
    virtualenv -p python3 "$EMACS_DIR/.venv"
fi

echo "Activating virtualenv"
source "$EMACS_DIR/.venv/bin/activate"
pip3 install -r requirements.txt --upgrade

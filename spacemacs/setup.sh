#!/bin/sh

SPACEMACS_DIR="`dirname \"$0\"`"              # relative
SPACEMACS_DIR="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

ln -sfv $SPACEMACS_DIR/.spacemacs ~
ln -sfv $SPACEMACS_DIR/snippets/* ~/.emacs.d/private/snippets/
ln -sfv $SPACEMACS_DIR/emacs.service ~/.config/systemd/user/

#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

ln -sfv $SCRIPT_DIR/.spacemacs ~/
ln -sfv $SCRIPT_DIR/snippets/* ~/.emacs.d/private/snippets/
ln -sfv $SCRIPT_DIR/emacs.service ~/.config/systemd/user/
ln -sfv $SCRIPT_DIR/emacsclient.desktop ~/.local/share/applications/

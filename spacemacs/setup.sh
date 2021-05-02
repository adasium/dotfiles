#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

mkdir -vp ~/.config/emacs/
mkdir -vp ~/.config/systemd/user/

ln -sfv $SCRIPT_DIR/.spacemacs ~/
mkdir -vp ~/.emacs.d/private/snippets/
ln -sfv $SCRIPT_DIR/snippets/* ~/.emacs.d/private/snippets/
ln -sfv $SCRIPT_DIR/emacs.service ~/.config/systemd/user/
mkdir -vp ~/.local/share/applications/
ln -sfv $SCRIPT_DIR/emacsclient.desktop ~/.local/share/applications/

ln -sfv $SCRIPT_DIR/requirements.txt ~/.config/emacs/
ln -sfv $SCRIPT_DIR/Pipfile ~/.config/emacs/

ln -sfv $SCRIPT_DIR/icons/vscode.png ~/.local/share/icons/

#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

if [ -d "$HOME/.emacs.d" ] && [ ! -d "$HOME/.emacs.d/.git" ]; then
    echo "Found Emacs config. Removing ~/.emacs.d"
    rm -rf ~/.emacs.d
fi

if [ ! -d "$HOME/.emacs.d" ] && [ ! -d "$HOME/.emacs.d/.git" ]; then
    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
else
    echo "Spacemacs is already installed"
fi

mkdir -vp ~/.config/emacs/
mkdir -vp ~/.config/systemd/user/

ln -sfv $SCRIPT_DIR/.spacemacs ~/
mkdir -vp ~/.emacs.d/private/snippets/
ln -sfv $SCRIPT_DIR/snippets/* ~/.emacs.d/private/snippets/
ln -sfv $SCRIPT_DIR/emacs.service ~/.config/systemd/user/
if command -v emacs; then
    EMACS_PATH=$(dirname $(command -v emacs))
    sed -i "s#/usr/local/bin#$EMACS_PATH#" ~/.config/systemd/user/emacs.service
fi

mkdir -vp ~/.local/share/applications/
ln -sfv $SCRIPT_DIR/emacsclient.desktop ~/.local/share/applications/
ln -sfv $SCRIPT_DIR/emacs.desktop ~/.local/share/applications/

ln -sfv $SCRIPT_DIR/requirements.txt ~/.config/emacs/
ln -sfv $SCRIPT_DIR/Pipfile ~/.config/emacs/

ln -sfv $SCRIPT_DIR/icons/vscode.png ~/.local/share/icons/

systemctl --user daemon-reload
systemctl --user enable emacs

./install_python_dependencies.sh

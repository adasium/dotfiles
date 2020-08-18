#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))
SEP='--------------------'


echo $SEP Setting up Vim $SEP
./vim/setup.sh

ln -sfv $SCRIPT_DIR/tmux/.tmux.conf ~

ln -sfv $SCRIPT_DIR/zsh/.zshrc ~
ln -sfv $SCRIPT_DIR/bash/.bash_aliases ~

echo $SEP Setting up Spacemacs $SEP
./spacemacs/setup.sh

#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))
SEP='--------------------'

setting_up() {
    echo $SEP Setting up $@ $SEP
}

setting_up Vim
./vim/setup.sh

setting_up Spacemacs
./spacemacs/setup.sh

setting_up Tmux
ln -sfv $SCRIPT_DIR/tmux/.tmux.conf ~

setting_up ZSH
ln -sfv $SCRIPT_DIR/zsh/.zshrc ~

setting_up Bash aliases
ln -sfv $SCRIPT_DIR/bash/.bash_aliases ~

setting_up Cinnamon settings
./cinnamon/setup.sh

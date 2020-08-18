#!/bin/sh


MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

ln -sfv $MY_PATH/vim/.vimrc ~
mkdir -p ~/.vim/
ln -sfv $MY_PATH/vim/.config ~/.vim/
ln -sfv $MY_PATH/vim/UltiSnips ~/.vim/

ln -sfv $MY_PATH/tmux/.tmux.conf ~

ln -sfv $MY_PATH/zsh/.zshrc ~
ln -sfv $MY_PATH/bash/.bash_aliases ~

./spacemacs/setup.sh

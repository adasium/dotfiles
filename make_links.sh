#!/bin/sh


MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

ln -sf $MY_PATH/vim/.vimrc ~
mkdir ~/.vim/
ln -sf $MY_PATH/vim/.config ~/.vim/
ln -sf $MY_PATH/vim/UltiSnips ~/.vim/

ln -sf $MY_PATH/tmux/.tmux.conf ~

ln -sf $MY_PATH/zsh/.zshrc ~
ln -sf $MY_PATH/bash/.bash_aliases ~

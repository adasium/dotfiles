#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

echo "Installing Vim-Plug to ~/.vim/autoload/plug.vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sfv $SCRIPT_DIR/.vimrc ~/
ln -sfv $SCRIPT_DIR/.config ~/.vim/
ln -sfv $SCRIPT_DIR/UltiSnips ~/.vim/

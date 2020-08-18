#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

echo "Installing Vim-Plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sfv $SCRIPT_DIR/vim/.vimrc ~/
ln -sfv $SCRIPT_DIR/vim/.config ~/.vim/
ln -sfv $SCRIPT_DIR/vim/UltiSnips ~/.vim/

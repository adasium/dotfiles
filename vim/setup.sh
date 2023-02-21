#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))


if command -v nvim &> /dev/null
then
    DEST_DIR="$HOME/.config/nvim/"
    VIM=nvim
    VIMRC_PATH="$DEST_DIR/init.vim"
else
    DEST_DIR="$HOME/.vim/"
    VIM=vim
    VIMRC_PATH="$HOME/.vimrc"
fi

echo "Installing Vim-Plug to ~/.vim/autoload/plug.vim"
curl -fLo $DEST_DIR/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -sfv $SCRIPT_DIR/.vimrc $VIMRC_PATH
ln -sfv $SCRIPT_DIR/.config $DEST_DIR
ln -sfv $SCRIPT_DIR/UltiSnips $DEST_DIR
$VIM -c PlugInstall +qall

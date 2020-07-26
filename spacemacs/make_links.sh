#!/bin/sh


MY_PATH="`dirname \"$0\"`"              # relative
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  # absolutized and normalized

ln -sf $MY_PATH/snippets/* ~/.emacs.d/private/snippets/
ln -sf $MY_PATH/emacs.service ~/.config/systemd/user/

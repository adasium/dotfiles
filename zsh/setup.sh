#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))
COMMIT=57e8c959a02ca8c2aeda3980480a50a1f82f6953

ln -sfv $SCRIPT_DIR/zsh/.zshrc ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/$COMMIT/tools/install.sh)"

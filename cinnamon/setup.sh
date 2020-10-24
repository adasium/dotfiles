#!/bin/sh

SCRIPT_DIR=$(dirname $(realpath -s $0))

dconf load /org/cinnamon/ < cinnamon.dconf

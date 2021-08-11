#!/bin/bash
xdotool windowactivate `xdotool search --onlyvisible --name $1 | tail -n 1`  # because head -n 1 failed for Firefox

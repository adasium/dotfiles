#!/bin/bash

SCREENS=($(xrandr | awk '/ connected/ {print $1}'))

SCREEN_FOUND=false
for item in "${SCREENS[@]}"; do
    if [[ "$SCREEN_FOUND" == true ]]; then
        WACOM_SCREEN=$item
        break
    fi
    if [[ $WACOM_SCREEN == "$item" ]]; then
        SCREEN_FOUND=true
        if [[ $item == "${SCREENS[-1]}" ]]; then
            WACOM_SCREEN=${SCREENS[0]}
        fi
    fi
done
if [[ $WACOM_SCREEN == '' ]]; then
    WACOM_SCREEN=${SCREENS[0]}
fi
echo $WACOM_SCREEN
export WACOM_SCREEN
xsetwacom set "$(xsetwacom --list devices | grep stylus | awk -F "id:" '{print $1}' | awk '{$1=$1};1' )" MapToOutput "$WACOM_SCREEN"

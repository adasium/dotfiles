#!/usr/bin/env zsh

UPRECORDS_COUNT=$(uprecords -s | awk '/->/ {print $2}')
uprecords -s | tail -n $UPRECORDS_COUNT

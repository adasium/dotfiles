#!/bin/bash
# https://github.com/toadjaune/pulseaudio-config

GET_DEFAULT_CMD="tr '\n' '|' | sed -e 's/*\{0,1\}[[:space:]]*index/\n\0/g' | grep '*'"
DEFAULT_INPUT_CMD="pacmd list-sources | $GET_DEFAULT_CMD | sed 's/|/\n/g' | grep 'name:' | awk -F '<|>' '{print \$2}'"
DEFAULT_OUTPUT_CMD="pacmd list-sinks | $GET_DEFAULT_CMD | sed 's/|/\n/g' | grep 'name:' | awk -F '<|>' '{print \$2}'"


MICROPHONE=$(eval "$DEFAULT_INPUT_CMD")
SPEAKERS=$(eval "$DEFAULT_OUTPUT_CMD")

VIRTUAL1_EXISTS="$(pactl list sinks short | grep virtual1)"
VIRTUAL2_EXISTS="$(pactl list sinks short | grep virtual2)"

echo "Default input: $MICROPHONE"
echo "Default output: $SPEAKERS"

if [ ! "$VIRTUAL1_EXISTS" ] && [ ! "$VIRTUAL2_EXISTS" ]; then
    pactl load-module module-null-sink sink_name=virtual1 sink_properties=device.description="virtual1"
    pactl load-module module-null-sink sink_name=virtual2 sink_properties=device.description="virtual2"

    pactl load-module module-loopback source=virtual1.monitor sink=$SPEAKERS latency_msec=5
    pactl load-module module-loopback source=virtual1.monitor sink=virtual2 latency_msec=5
    pactl load-module module-loopback source=$MICROPHONE sink=virtual2 latency_msec=5

    # Applications like Discord will probably not be able to set monitor device as input.
    # We workaround it by setting virtual2.monitor as default input which makes it default in the app.
    pacmd set-default-source virtual2.monitor
fi

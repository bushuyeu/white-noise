#!/bin/bash

# Path to the white noise file
NOISE_FILE="/Users/pb/code/white_noise/white_noise.wav"

# Absolute path to 'play' (part of sox)
PLAY_CMD="/opt/homebrew/bin/play"

# Path to store PID file
PID_FILE="/tmp/white_noise.pid"

# Force default audio output device
export AUDIODEV="default"

# Check if already playing
if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
    # Already running — stop it
    kill "$(cat "$PID_FILE")"
    rm -f "$PID_FILE"
    osascript -e 'display notification "White noise stopped." with title "White Noise"'
else
    # Start playing
    "$PLAY_CMD" -q "$NOISE_FILE" repeat - &
    echo $! > "$PID_FILE"
    osascript -e 'display notification "White noise started." with title "White Noise"'
fi
#!/bin/bash

# Resolve the directory this script is in
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NOISE_FILE="$DIR/white_noise.wav"
PLAY_CMD="/opt/homebrew/bin/play"
PID_FILE="/tmp/white_noise.pid"

# Force default audio device (macOS needs this sometimes)
export AUDIODEV="default"

# If a previous noise process is running, stop it
if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
    kill "$(cat "$PID_FILE")"
    rm -f "$PID_FILE"
    osascript -e 'display notification "White noise stopped." with title "White Noise 🎶"'
else
    # Start playing with fade-in and fade-out to avoid clicks
    "$PLAY_CMD" -q "$NOISE_FILE" \
        fade t 3 0 3 \
        repeat - &
    echo $! > "$PID_FILE"
    osascript -e 'display notification "White noise started." with title "White Noise 🎶"'
fi
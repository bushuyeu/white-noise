#!/bin/bash

# Resolve the directory this script is in
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NOISE_FILE="$DIR/white_noise.wav"
PLAY_CMD="/opt/homebrew/bin/play"
PID_FILE="/tmp/white_noise.pid"

# Force default audio device (macOS needs this sometimes)
export AUDIODEV="default"

# Check if noise file exists
if [ ! -f "$NOISE_FILE" ]; then
    osascript -e 'display notification "White noise file not found." with title "White Noise 🎶 Error"'
    exit 1
fi

if [ -f "$PID_FILE" ] && kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
    # Stop previous noise
    kill "$(cat "$PID_FILE")" && rm -f "$PID_FILE"
    osascript -e 'display notification "⏹️ Stopped " with title "White Noise 🎶"'
else
    # Start playing noise in the background
    "$PLAY_CMD" -q "$NOISE_FILE" repeat - &
    echo $! > "$PID_FILE"
    osascript -e 'display notification "▶️ Started  " with title "White Noise 🎶"'
fi
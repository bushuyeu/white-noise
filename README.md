# White Noise Toggler 🎶

[![Built with Bash](https://img.shields.io/badge/Built%20with-Bash-4EAA25?logo=gnubash&logoColor=white)](https://www.gnu.org/software/bash/)
[![Platform: macOS](https://img.shields.io/badge/Platform-macOS-lightgrey?logo=apple&logoColor=white)](https://www.apple.com/macos/)

A simple script to **play and stop white noise** on macOS with a **⌥ + ⌘ + P shortcut**.

✅ Launch white noise for focus, meditation, or sleep  
✅ Toggle it on/off instantly  
✅ MacOS notifications

---

## 🛠 How It Works

- Uses `play` from `sox` (installed via Homebrew) to play a `.wav` pink noise file in an infinite, seamless loop.
- Karabiner-Elements maps a **keyboard shortcut** (Option + Command + P) to trigger the script.
- The script tracks the playback process using a PID file, ensuring clean start/stop toggling.
- Displays native macOS notifications when noise starts or stops.

---

## 🚀 Quick Setup

### 1. Clone or Download the Repo

```bash
cd ~/code
git clone https://your-repo-link white_noise
cd white_noise
```

### 2. Make the Script Executable

```bash
chmod +x toggle_white_noise.sh
```

### 3. Install Karabiner-Elements

```bash
brew install --cask karabiner-elements
```

Or download from [Karabiner-Elements](https://karabiner-elements.pqrs.org/).  
✅ Allow Accessibility and Input Monitoring permissions.

### 4. Set Up the Keybinding

- Place `white_noise_play.json` in:

```bash
~/.config/karabiner/assets/complex_modifications/
```

- Open Karabiner → Complex Modifications → Add Rule → Enable:
  **"Toggle White Noise with Option+Command+P"**

### 5. Done!

Press `⌥ Option + ⌘ Command + P` to toggle the white noise.

---

## 📂 Folder Structure

```plaintext
white_noise/
├── toggle_white_noise.sh         # Main script to toggle noise
├── white_noise.wav               # White noise audio file
└── white_noise_play.json         # Karabiner-Elements hotkey config
```

---

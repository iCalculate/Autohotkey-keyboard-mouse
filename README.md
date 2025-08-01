# KeyMouse

[![AutoHotkey](https://img.shields.io/badge/AutoHotkey-v2.0+-brightgreen.svg)](https://www.autohotkey.com/download/)
[![Platform](https://img.shields.io/badge/Platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![License](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

**KeyMouse** is an AutoHotkey-based keyboard-to-mouse control utility designed for efficient and precise keyboard-only mouse operation. This tool is particularly useful for users seeking ergonomic input alternatives or enhanced keyboard productivity.

## 🔧 Features

- **Keyboard Mouse Movement (WASD-based)**  
  Use `W`, `A`, `S`, and `D` to control the mouse cursor smoothly, with physics-inspired acceleration and deceleration.

- **Toggle Modes**  
  Press `Alt + Win + I` to enter "Insert Mode" (mouse control enabled).  
  Press `Alt + Win + N` to enter "Normal Mode" (mouse control disabled).

- **Mouse Button Emulation**  
  - `J` = Left Click  
  - `K` = Middle Click  
  - `L` = Right Click  
  - `U` = Drag (Hold for click-and-drag)

- **Scroll Wheel Support**  
  - `Q` = Scroll Up  
  - `E` = Scroll Down

- **Speed Control**  
  Customizable velocity, resistance, and acceleration for natural and responsive cursor movement.

- **Insert Mode Indicator**  
  Popup display indicating mode changes (Insert vs. Normal), visible on toggle.

## 🖥️ Installation

1. Install [AutoHotkey v2](https://www.autohotkey.com/download/).
2. Clone or download this repository.
3. Run `KeyMouse_xcdu.ahk` (or use the precompiled `KeyMouse_xcdu.exe`).

## ⌨️ Keybindings Summary

| Key         | Function              |
|-------------|-----------------------|
| W / A / S / D | Move Cursor          |
| J           | Left Click            |
| K           | Middle Click          |
| L           | Right Click           |
| U (Hold)    | Drag                  |
| Q / E       | Scroll Up / Down      |
| Alt + Win + I | Enter Insert Mode   |
| Alt + Win + N | Enter Normal Mode   |

## ⚠️ Notes

- Some keys are temporarily disabled while in Insert Mode (e.g., original WASD input).
- You can customize key mappings and physics settings in the `.ahk` script (e.g., `FORCE`, `RESISTANCE`).
- For Windows compatibility, run the script with administrator privileges if mouse control fails in some applications.

## 📄 License

MIT License

---

For feedback or contributions, feel free to open an issue or pull request.

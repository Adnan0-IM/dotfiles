# 🧾 Tmux Cheatsheet

This cheatsheet summarizes custom keybindings, plugins, and useful defaults from your tmux setup.

---

## ⚡ General Settings

- **Prefix key** → <kbd>`</kbd> (backtick, instead of <kbd>Ctrl-b</kbd>)
- **Reload config** → <kbd>`</kbd> + <kbd>r</kbd>
- **Window/pane indexing starts at 1**
- **Scrollback history limit** → 10,000
- **Mouse support enabled**
- **Escape time** = 0 (faster response)

---

## 🪟 Windows

- **New window (same path)** → <kbd>`</kbd> + <kbd>c</kbd>
- **Switch session quickly** → <kbd>`</kbd> + <kbd>n</kbd>
- **Sessionizer script** → <kbd>`</kbd> + <kbd>f</kbd>

---

## 📐 Splits & Panes

- **Horizontal split** → <kbd>`</kbd> + <kbd>=</kbd>
- **Vertical split** → <kbd>`</kbd> + <kbd>-</kbd>
- **Resize panes (vim-style)**
  - <kbd>`</kbd> + <kbd>h</kbd> → Shrink left
  - <kbd>`</kbd> + <kbd>l</kbd> → Grow right
  - <kbd>`</kbd> + <kbd>j</kbd> → Shrink down
  - <kbd>`</kbd> + <kbd>k</kbd> → Grow up
- **Maximize/restore pane** → <kbd>`</kbd> + <kbd>m</kbd>

---

## 📋 Copy Mode (vim-style)

- Enter copy mode → <kbd>`</kbd> + <kbd>v</kbd>
- Start selection → <kbd>v</kbd>
- Yank selection → <kbd>y</kbd>
- Paste buffer → <kbd>`</kbd> + <kbd>p</kbd>
- Paste in copy-mode → <kbd>P</kbd>

---

## 📦 Popups

- **File manager (Yazi)** → <kbd>`</kbd> + <kbd>C-y</kbd>
- **Terminal (zsh)** → <kbd>`</kbd> + <kbd>C-t</kbd>
- **Git UI (lazygit)** → <kbd>`</kbd> + <kbd>C-g</kbd>
- **Music player (rmpc)** → <kbd>`</kbd> + <kbd>C-m</kbd>
- **Config menu** → <kbd>`</kbd> + <kbd>d</kbd>
  - <kbd>z</kbd> → `.zshrc`
  - <kbd>p</kbd> → `.zprofile`
  - <kbd>t</kbd> → `tmux.conf`
  - <kbd>v</kbd> → Neovim config
  - <kbd>q</kbd> → Quit menu

---

## 🎨 Theme & UI (Catppuccin)

- **Flavor** → `mocha`
- **Status bar** → top
- **Popup style** → Transparent background (`bg=default, fg=#cdd6f4`)
- **Active pane border** → Lavender
- **Custom window flags** →  active,  zoom,  mark,  bell, etc.
- **Left status bar** → Session info
- **Right status bar** → Directory + uptime

---

## 🔌 Plugin Keybinds

### 🔹 vim-tmux-navigator

- <kbd>Ctrl-h</kbd> → Move to left pane (or Vim split)
- <kbd>Ctrl-l</kbd> → Move to right pane (or Vim split)
- <kbd>Ctrl-k</kbd> → Move up
- <kbd>Ctrl-j</kbd> → Move down

### 🔹 tmux-sessionx

- <kbd>`</kbd> + <kbd>o</kbd> → Session switcher UI

### 🔹 tmux-resurrect / continuum

- **Save session** → <kbd>`</kbd> + <kbd>Ctrl-s</kbd>
- **Restore session** → <kbd>`</kbd> + <kbd>Ctrl-r</kbd>
- **Auto-save** every 15 minutes (continuum)

### 🔹 catppuccin/tmux

- Status bar & pane styling, no manual keys

### 🔹 tmux-online-status

- Shows connectivity (icon)

### 🔹 tmux-battery

- Shows battery percentage & status

---

## 📖 Useful Default Tmux Keys (still active)

> (All use the prefix <kbd>`</kbd> first)

- **Switch window** → <kbd>0–9</kbd>
- **Next/prev window** → <kbd>n</kbd> / <kbd>p</kbd>
- **Kill window** → <kbd>&</kbd>
- **Kill pane** → <kbd>x</kbd>
- **Detach session** → <kbd>d</kbd>
- **Rename window** → <kbd>,</kbd>
- **List sessions** → <kbd>s</kbd>
- **Move pane left/right** → <kbd>{</kbd> / <kbd>}</kbd>
- **Rotate panes** → <kbd>Ctrl-o</kbd>
- **Balance panes** → <kbd>Alt-1</kbd> (even horizontal) / <kbd>Alt-2</kbd> (even vertical)
- **Clock mode** → <kbd>t</kbd>
- **Search pane output** → <kbd>?</kbd> (in copy mode)

---

## 🔑 Prefix Summary

All bindings are under **<kbd>`</kbd> (backtick)**:

- <kbd>c</kbd> → New window
- <kbd>=</kbd> / <kbd>-</kbd> → Split horizontal/vertical
- <kbd>j/k/h/l</kbd> → Resize panes
- <kbd>m</kbd> → Toggle pane maximize
- <kbd>v</kbd> → Copy mode
- <kbd>p</kbd> → Paste buffer
- <kbd>r</kbd> → Reload tmux config
- <kbd>d</kbd> → Config popup menu
- <kbd>C-y</kbd> → Yazi popup
- <kbd>C-t</kbd> → Terminal popup
- <kbd>C-g</kbd> → Lazygit popup
- <kbd>C-m</kbd> → Music popup
- <kbd>o</kbd> → Session switcher (plugin)
- <kbd>Ctrl-s</kbd> → Save session (plugin)
- <kbd>Ctrl-r</kbd> → Restore session (plugin)

---

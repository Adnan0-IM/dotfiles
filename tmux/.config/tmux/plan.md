# Plan: Mirror tmux keybindings in herdr

## Goal
Replace herdr's default keybindings with tmux-style keys, including floating/popup binds (yazi, floating zsh, lazygit, rmpc), keeping the rose-pine theme.

## Step 1 — Rewrite `~/.config/herdr/config.toml`
Replace the existing 5-line file with:

```toml
onboarding = false

[theme]
name = "rose-pine"
auto_switch = false

[keys]
prefix = "ctrl+b"            # tmux unbound C-b, so nesting keeps both working
reload_config = "prefix+r"   # tmux r = reload
resize_mode = "prefix+shift+r"  # freed up from r
zoom = "prefix+m"            # tmux m = maximize (old herdr default was prefix+z)
workspace_picker = "prefix+o"   # tmux sessionx 'o'
goto = "prefix+f"            # tmux f = sessionizer (path jump)
new_tab = "prefix+c"         # tmux c = new window
split_horizontal = "prefix+minus" # tmux `-` = split -v (stacked)
split_vertical = "prefix+v"       # tmux `=` = split -h (side-by-side); herdr lacks '=' key
focus_pane_left = "prefix+h"
focus_pane_down = "prefix+j"
focus_pane_up = "prefix+k"
focus_pane_right = "prefix+l"
close_pane = "prefix+x"      # tmux default x = kill-pane
switch_tab = "prefix+1..9"
edit_scrollback = "prefix+e"

# floating/popup binds (same feel as tmux popups)
[[keys.command]]
key = "prefix+y"
type = "popup"
command = "yazi"
width = "90%"
height = "90%"

[[keys.command]]
key = "ctrl+t"
type = "popup"
command = "zsh"
width = "80%"
height = "80%"

[[keys.command]]
key = "ctrl+g"
type = "popup"
command = "lazygit"
width = "90%"
height = "90%"

[[keys.command]]
key = "prefix+shift+m"
type = "popup"
command = "rmpc"
width = "95%"
height = "95%"
```

## Step 2 — Create `plan.md`
This file.

## Step 3 — Verify
- `herdr config check` — validate TOML/diagnostics
- `herdr server reload-config` — hot-reload (or restart herdr)

## Mapping summary
| tmux | herdr | Notes |
|---|---|---|
| `` ` `` prefix | `ctrl+b` | safe when nested in tmux |
| `r` reload | `prefix+r` | resize mode moved to `prefix+shift+r` |
| `c` new window | `prefix+c` | default |
| `-` split -v | `prefix+-` | default (stacked) |
| `=` split -h | `prefix+v` | herdr has no `=` key name |
| `m` maximize | `prefix+m` | |
| `h/j/k/l` focus | `prefix+h/j/k/l` | matches vim-tmux-navigator |
| `o` sessionx / `f` sessionizer | `prefix+o` / `prefix+f` | nearest analogs |
| `y` yazi | `prefix+y` popup | |
| `C-t` float shell | `ctrl+t` popup | |
| `C-g` lazygit | `ctrl+g` popup | |
| `C-m` rmpc | `prefix+shift+m` | `ctrl+m` ≈ Enter in herdr |

## Skipped / incompatible
- `d` config menu open — requires a custom helper script; omitted
- `v` copy-mode / `p` paste — herdr auto-copies on select; copy/edit-scrollback is `prefix+e`
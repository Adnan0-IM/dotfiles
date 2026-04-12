# Dotfiles

Opinionated dotfiles for a consistent Linux dev environment.

## Overview

- Purpose: centralize shell, editor, terminal, and tool configs.
- Approach: GNU Stow for symlink management (recommended), or manual symlinks.

## Repository Layout

Each folder is a Stow package that mirrors the final target path in `$HOME`.

- `.config/` - Shared config files that live under `~/.config` (for example, Starship).
- `bashrc/` - Bash config (for example, `~/.bashrc` or `~/.config/bashrc`).
- `Code/` - VS Code user settings on Linux (`~/.config/Code/User`).
- `fastfetch/` - Fastfetch config (`~/.config/fastfetch`).
- `ghostty/` - Ghostty terminal config (`~/.config/ghostty`).
- `home/` - Home-level dotfiles (for example, `~/.gitconfig`).
- `hypr/` - Hyprland config (`~/.config/hypr`).
- `kitty/` - Kitty terminal config (`~/.config/kitty`).
- `niri/` - Niri compositor config (`~/.config/niri`).
- `nvim/` - Neovim config (`~/.config/nvim`).
- `tmux/` - Tmux config (`~/.tmux.conf` or `~/.config/tmux`).
- `vscode/` - Extra VS Code assets (snippets, keybindings, etc.).
- `yazi/` - Yazi file manager config (`~/.config/yazi`).
- `zshrc/` - Zsh config (for example, `~/.zshrc` or `~/.config/zshrc`).

Note: exact targets depend on the folder's internal structure. With Stow, the package should contain the final path layout.

## Quick Setup (Linux)

### Prerequisites

- GNU Stow

```sh
sudo pacman -S stow                           # Arch
# or
sudo dnf install stow                         # Fedora
# or
sudo apt update && sudo apt install -y stow   # Debian/Ubuntu
# or
sudo zypper install stow                      # OpenSUSE
```

### Using GNU Stow (recommended)

```sh
cd /home/adnan/dotfiles

# Preview what will be linked (no changes)
stow -n -v .config bashrc fastfetch ghostty hypr kitty niri nvim tmux yazi zshrc Code vscode home -t ~

# Apply the symlinks to your home directory
stow .config bashrc fastfetch ghostty hypr kitty niri nvim tmux yazi zshrc Code vscode home -t ~
```

If Stow reports conflicts, back up or remove the existing files first, or use `stow -D <pkg>` to unstow and retry.

### Manual Symlinks (alternative)

Use manual links if you want explicit control or a folder is not Stow-ready. Adjust the paths to match the files you want.

```sh
ln -s /home/adnan/dotfiles/zshrc/.zshrc ~/.zshrc
ln -s /home/adnan/dotfiles/bashrc/.bashrc ~/.bashrc
ln -s /home/adnan/dotfiles/home/.gitconfig ~/.gitconfig
ln -s /home/adnan/dotfiles/nvim ~/.config/nvim
ln -s /home/adnan/dotfiles/kitty ~/.config/kitty
ln -s /home/adnan/dotfiles/ghostty ~/.config/ghostty
ln -s /home/adnan/dotfiles/fastfetch ~/.config/fastfetch
```

## Component Notes

- Zsh: install `zsh`. Optional prompt: Starship.
- Bash: standard shell config if you use Bash.
- Neovim: requires `nvim` in PATH.
- Tmux: config may live at `~/.tmux.conf` or `~/.config/tmux` depending on layout.
- VS Code: user settings live in `~/.config/Code/User` on Linux.

## Maintenance

- Add new configs: create a folder that mirrors the target path tree, then `stow <folder> -t ~`.
- Unstow: `stow -D <folder> -t ~`.
- Dry run: `stow -n -v <folder> -t ~`.
- Conflicts: move or remove existing files, then retry.

## Troubleshooting

- Wrong paths: ensure the package mirrors the destination path (for example, `nvim/.config/nvim/...`).
- Stow did not link: use verbose preview `stow -n -v <folder> -t ~` and inspect output.
- Apps ignore config: verify the symlink targets exist and the app uses the expected config dir.

---

Maintained by Adnan0-IM

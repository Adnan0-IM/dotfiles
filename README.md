# Dotfiles

Opinionated dotfiles for a consistent Linux dev environment.

## Overview

- **Purpose:** Centralize shell, editor, terminal, and tool configs.
- **Approach:** Use GNU Stow (recommended) or manual symlinks.

## Structure

- `bashrc/` — Bash shell configuration.
- `Code/` — VS Code (Linux) settings (typically `~/.config/Code/User`).
- `fastfetch/` — Fastfetch config (typically `~/.config/fastfetch`).
- `ghostty/` — Ghostty terminal configs (typically `~/.config/ghostty`).
- `home/` — Home-level files (e.g., top-level dotfiles like `.gitconfig`).
- `kitty/` — Kitty terminal configs (typically `~/.config/kitty`).
- `nvim/` — Neovim configuration (typically `~/.config/nvim`).
- `tmux/` — Tmux configuration.
- `vscode/` — Additional VS Code-related settings/snippets.
- `zshrc/` — Zsh configuration (e.g., `~/.config/zshrc`).
- `bashrc/` — Bash configuration (e.g., `~/.config/bashrc`).
- `.config/` — starship configuration (e.g., `~/.config`).

Note: Exact target paths depend on how each folder mirrors the destination. With Stow, each folder should contain the final path structure.

## Quick Setup (Linux)

### Prerequisites

- GNU Stow installed

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
stow -n -v bashrc fastfetch ghostty kitty nvim tmux zshrc Code vscode home -t ~

# Apply the symlinks to your home directory
stow bashrc fastfetch ghostty kitty nvim tmux zshrc Code vscode home -t ~
```

If Stow reports conflicts, back up or remove the existing files first, or use `stow -D <pkg>` to unstow and retry.

### Manual Symlinks (alternative)

Use when you prefer explicit links or if a folder isn’t stow-ready:

```sh
ln -s /home/adnan/dotfiles/zshrc/.zshrc ~/.zshrc
ln -s /home/adnan/dotfiles/bashrc/.bashrc ~/.bashrc
ln -s /home/adnan/dotfiles/homw ~/.config/home
ln -s /home/adnan/dotfiles/nvim ~/.config/nvim
ln -s /home/adnan/dotfiles/kitty ~/.config/kitty
ln -s /home/adnan/dotfiles/ghostty ~/.config/ghostty
ln -s /home/adnan/dotfiles/fastfetch ~/.config/fastfetch
ln -s /home/adnan/dotfiles/.config ~/.config
```

## Component Notes

- **Zsh (`zshrc/`):** Ensure `zsh` is installed. Optionally use a prompt like Starship.
- **Bash (`bashrc/`):** Standard shell config if you use Bash.
- **Neovim (`nvim/`):** Requires Neovim. Place under `~/.config/nvim`.
- **Tmux (`tmux/`):** Typically links to `~/.tmux.conf` or `~/.config/tmux` depending on layout.
- **Kitty (`kitty/`):** Place under `~/.config/kitty`.
- **Ghostty (`ghostty/`):** Place under `~/.config/ghostty`.
- **Fastfetch (`fastfetch/`):** Place under `~/.config/fastfetch`.
- **VS Code (`Code/`, `vscode/`):** Linux user settings reside in `~/.config/Code/User`. Workspace-level settings may be in `vscode/`.

## Maintenance

- **Add new configs:** Create a folder mirroring the destination path tree, then `stow <folder> -t ~`.
- **Unstow:** `stow -D <folder> -t ~` to remove symlinks.
- **Dry-run:** `stow -n -v <folder> -t ~` to preview changes.
- **Conflicts:** Move or remove existing files, then retry.

## Troubleshooting

- Wrong paths? Check the folder’s internal structure mirrors the target location (e.g., `nvim/.config/nvim/…`).
- Stow didn’t link? Use verbose preview: `stow -n -v <folder> -t ~` and inspect output.
- Terminal/editor not picking up config? Verify symlink targets exist and the app’s config directory is correct for your distro.

---

Maintained by Adnan0-IM

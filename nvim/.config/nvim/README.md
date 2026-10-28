# Neovim Config

Personal Neovim configuration built on [LazyVim 16](https://www.lazyvim.org) with
[lazy.nvim](https://github.com/folke/lazy.nvim). Verified on **Neovim 0.12.5**.
45 plugins, ~29 loaded at startup, first paint ≈ 150 ms on this machine.

## Layout

```
nvim/.config/nvim/
├── init.lua                        # entrypoint: bootstraps lazy.nvim + dormant VSCode tweaks
├── lazyvim.json                    # enabled LazyVim extras (managed via :LazyExtras)
├── lazy-lock.json                  # pinned plugin commits (45 plugins, pruned of unused)
├── colors/dms.lua                  # "dms" colorscheme — Matugen/DankMaterialShell theme via base46
├── lua/
│   ├── config/
│   │   ├── lazy.lua                # lazy.nvim bootstrap: spec, defaults, update checker
│   │   ├── options.lua             # editor options
│   │   ├── keymaps.lua             # global keymaps
│   │   └── autocmds.lua            # snacks explorer highlight fix (match buffer theme)
│   ├── lualine/themes/dms.lua      # lualine colorscheme bridge (base46 → lualine)
│   └── plugins/                    # one spec per plugin, auto-imported via { import = "plugins" }
└── stylua.toml                     # formatter config (spaces, width 120)
```

### Startup chain

1. `init.lua` → `require("config.lazy")`
2. `config/lazy.lua` clones `lazy.nvim` (stable branch) if missing and builds the spec:
   `{ "LazyVim/LazyVim", import = "lazyvim.plugins" }` → `{ import = "plugins" }` → `bg.nvim` (eager)
3. `config/options.lua` loads before plugins; LazyVim applies defaults, then `dms` colorscheme
4. `config/keymaps.lua` + `config/autocmds.lua` load on `VeryLazy`

Custom plugins default to `lazy = true` and `version = false` (track latest commit) per
`config/lazy.lua` `defaults`. With `lazy = true`, a plugin spec without an
event/keys/ft/cmd trigger will never load on its own — anything like that needs an explicit
lazy trigger (one example: `herdr-nvim` uses `event = "VeryLazy"`). The update checker
(`:Lazy check`) is on but silent.

## Enabled LazyVim extras

mini-surround, yanky, fzf, harpoon2, mini-files, prettier, go, json, markdown, prisma,
python, sql, tailwind, toml, typescript (+biome), yaml, eslint, dot, mini-hipatterns, vscode.
Toggle with `:LazyExtras`.

## Plugins

| Spec file | Plugin | What it does | Keybinding |
|---|---|---|---|
| `plugins/base64.lua` | AvengeMedia/base46 | Theme engine required by `colors/dms.lua` (pinned to `v3.0`) | — |
| `plugins/colorscheme.lua` | LazyVim opts | Sets `colorscheme = "dms"` | — |
| `plugins/colors-disabled.lua` | tokyonight/catppuccin | Disables LazyVim's built-in fallback colorschemes (see note below) | — |
| `plugins/explorer.lua` | folke/snacks.nvim | Enables the Snacks file explorer; **redundant** — `plugins/snacks.lua` already sets `explorer = { enabled = true }`, safe to delete | `\` toggle/focus |
| `plugins/snacks.lua` | folke/snacks.nvim | Eager snacks setup (`priority = 1000`): dashboard, picker keys (`<leader><space>`, `<leader>/`, LSP `gd/gr/…`), notifier, quickfile, scratch buffers | see file |
| `plugins/herdr-nvim.lua` | ChmaraX/herdr-nvim | Gather buffer comments and hand them to an AI agent (`event = "VeryLazy"`, needed because it has no other lazy trigger) | `<leader>a` prefix, `:Herdr` |
| `plugins/lspconfig.lua` | neovim/nvim-lspconfig | vtsls for TS/JS (tsserver/ts_ls disabled) | `gD`, `gR`, `<leader>co/cM/cu/cD/cV` |
| `plugins/lualine.lua` | nvim-lualine/lualine.nvim | Overrides LazyVim's statusline theme with `dms` | — |
| `plugins/markdown-preview.lua` | iamcco/markdown-preview.nvim | Browser-based Markdown preview | `<leader>cp` (markdown buffers) |
| `plugins/multicursor.lua` | brenton-leighton/multiple-cursors | Multi-cursor editing, pinned to latest release tag | `gb` select next word match |
| `plugins/nvim-tmux-navigator.lua` | christoomey/vim-tmux-navigator | Seamless pane navigation with tmux | `<C-h>` `<C-j>` `<C-k>` `<C-l>` `<C-\>` |
| `plugins/render-markdown.lua` | MeanderingProgrammer/render-markdown | Renders Markdown headings/code in-buffer | `<leader>um` toggle |

Terminal = LazyVim's built-in Snacks terminal (`<leader>ft` / `<leader>fT` / root-dir variants).

> **Spec merge gotcha:** `enabled = false` entries must not sit in the same returned list as
> `{ "LazyVim/LazyVim", opts = ... }` — doing that silently breaks the opts merge and the
> colorscheme falls back. That's why the tokyonight/catppuccin disables live in their own
> `colors-disabled.lua`.

## Keymaps

| Key | Action |
|---|---|
| `x` | Delete char without yanking (`"_x`) |
| `+` / `-` | Increment / decrement number (`<C-a>` / `<C-x>`) |
| `<C-a>` | Select whole buffer |
| `<leader>w` | Write (`:update`) |
| `<leader>q` / `<leader>Q` | Quit window / quit all |
| `<leader>f` | Reveal current file in Snacks explorer |
| `<leader>t` | Toggle Snacks explorer |
| `te` | `:tabedit` (presents command line) |
| `<Tab>` / `<S-Tab>` | Next / previous tab |
| `tw` | Close tab |
| `ss` / `sv` | Horizontal / vertical split |
| `sh` `sj` `sk` `sl` | Jump to left/below/above/right window |
| `<C-S-h>/<C-S-j>/<C-S-k>/<C-S-l>` | Resize window left/down/up/right |
| `jk` (insert) | Leave insert mode |
| `\` | Toggle/focus Snacks explorer |

### VSCode embedding

`plugins/vscode.lua` (the spec file wrapper) was deleted as a duplicate — it only re-imported
the extra. **The VSCode extra is still active** through `lazyvim.json`
(`extras.vscode`), plus the `vim.g.vscode` block in `init.lua`. If you don't edit files
inside VSCode, remove `"lazyvim.plugins.extras.vscode"` from `lazyvim.json` (or
`:LazyExtras`) to drop that machinery too.

## Options highlights (`/options.lua`)

`shiftwidth = 2`, `tabstop = 2`, `expandtab`, `scrolloff = 10`,
`ignorecase + smartcase`, `inccommand = split`, `splitkeep = cursor`,
`formatoptions` adds `r` to continue comments, and `TermOpen` applies a fully transparent
`winhighlight=Normal:Normal,FloatBorder:Normal`.

Minimal UI: `cmdheight = 0` and `laststatus = 0` — the statusline is hidden globally. The
`dms` lualine theme stays dormant until you remove `laststatus = 0`.

## Colorscheme — dms

`colors/dms.lua` talks to `AvengeMedia/base46` and DankMaterialShell:

1. Reads `~/.config/DankMaterialShell/settings.json` for per-mode theme config
2. Calls `dms ipc call theme getMode` to get the light/dark preference (synchronous —
   part of the ~20 ms colorscheme cost)
3. Harmonizes the nearest built-in theme with `#d0bcff` (Matugen-picked accent)
4. Uses libuv fs-watchers on both files, hot-reloading with a 100 ms debounce

Graceful fallbacks: if base46 isn't available (or DMS settings are unreadable) the file
`notify`s and returns; LazyVim then applies `habamax`. `lua/lualine/themes/dms.lua` is the
matching lualine bridge, returning a colorscheme lookup from `lualine.themes._base46`.

## Performance notes

- First paint ≈ 150 ms (measured); `lazy.nvim` done ≈ 50 ms
- Custom specs are `lazy = true` by default; a plugin spec with no trigger needs an explicit
  `event`/`keys`/`ft`/`cmd`.
- `:Lazy clean` / `:Lazy! clean` in headless mode also prunes `lazy-lock.json`; disabled
  plugins only disappear from disk after it.

## Things to keep clean / maintenance notes

- **Lockfile sync** — after touching a plugin spec run `:Lazy! sync` so `lazy-lock.json`
  matches the specs.
- **`colors-disabled.lua` placement** — keep the disables out of `colorscheme.lua` (see the
  merge gotcha above); new `enabled = false` entries belong in a file of their own or a file
  that doesn't carry `LazyVim` opts.
- **Pinned versions** — `multicursor.lua`, and `base46` are pinned (`version = "*"` resolves
  to the newest release tag; base46 additionally to the `v3.0` branch).
- **tmux + nvim** — `<C-h>/<C-j>/<C-k>/<C-l>` comes from `vim-tmux-navigator`; confirm the
  companion tmux plugin is sourced in `.tmux.conf`.

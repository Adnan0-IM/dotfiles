-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Make the Snacks explorer match the buffer theme.
--
-- The explorer window remaps its highlights via `winhighlight` to the
-- `SnacksPickerList*` groups, which by default use the float background
-- (NormalFloat) and `Visual` instead of the buffer's `Normal`/`CursorLine`.
-- base46 has no snacks-picker integration, so nothing else overrides them.
local function apply_snacks_picker_hl()
  vim.api.nvim_set_hl(0, "SnacksPickerList", { link = "Normal" })
  vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { link = "CursorLine" })
  -- The explorer is a real split, and Neovim draws its right-hand window
  -- separator with the box window's own highlight (WinSeparator, remapped by
  -- snacks to SnacksWinSeparator). Paint that line in the buffer background
  -- color so it disappears where the explorer meets the buffer. Normal splits
  -- keep their separators since those are drawn by the buffer's windows.
  local bg = vim.api.nvim_get_hl(0, { name = "Normal" }).bg
  if bg then
    vim.api.nvim_set_hl(0, "SnacksWinSeparator", { fg = bg })
  end
end

-- Re-apply on ColorScheme: base46.load() runs `hi clear`, which wipes these
-- groups (e.g. when the dms hot-reload watcher fires).
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "dms",
  callback = apply_snacks_picker_hl,
})

-- This file loads on VeryLazy, after the colorscheme was already applied at
-- startup, so apply once right away.
if vim.g.colors_name == "dms" then
  apply_snacks_picker_hl()
end

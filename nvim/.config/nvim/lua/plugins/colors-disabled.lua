-- LazyVim ships fallback colorschemes (tokyonight, catppuccin) that are never
-- used with the "dms" theme. Disable them so lazy.nvim drops their clones on
-- the next `:Lazy clean`.
--
-- NOTE: these must live in a dedicated spec file — placing `enabled = false`
-- specs next to the `{ "LazyVim/LazyVim", opts = ... }` override in
-- colorscheme.lua breaks that file's opts merge.
return {
  { "folke/tokyonight.nvim", enabled = false },
  { "catppuccin/nvim", name = "catppuccin", enabled = false },
}

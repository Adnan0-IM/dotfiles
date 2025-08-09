local colors = {
  bg = "#1a1a2e", -- Dark background
  fg = "#e0e0e0", -- Light foreground
  border = "#4a90e2", -- Unique border color
  accent = "#ff6f61", -- Accent color for emphasis
}

vim.api.nvim_set_hl(0, "ToggleTermNormal", { bg = colors.bg, fg = colors.fg })
vim.api.nvim_set_hl(0, "ToggleTermBorder", { fg = colors.border, bg = colors.bg })
vim.api.nvim_set_hl(0, "ToggleTermFloatBorder", { fg = colors.border, bg = colors.bg })

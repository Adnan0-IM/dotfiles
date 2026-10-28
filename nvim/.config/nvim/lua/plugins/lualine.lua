return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    opts.options = opts.options or {}
    opts.options.theme = "dms" -- pulls from lua/lualine/themes/dms.lua (base46)
  end,
}

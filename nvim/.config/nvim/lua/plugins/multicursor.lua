return {
  "brenton-leighton/multiple-cursors.nvim",
  version = "*", -- always pull latest tag
  opts = {}, -- all defaults
  keys = {
    { "gb", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Multi-cursor word" },
  },
}

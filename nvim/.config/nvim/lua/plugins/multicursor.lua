return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    -- mimic VS Code <C-d>
    vim.keymap.set({ "n", "x" }, "gb", function()
      mc.matchAddCursor(1)
    end, { desc = "Add cursor to next match" })
    vim.keymap.set({ "n", "x" }, "gB", mc.matchAllCursors, { desc = "Add cursor to all matches" })
    vim.keymap.set("n", "<Esc>", mc.clearCursors)
  end,
}

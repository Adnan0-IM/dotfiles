-- Snacks explorer tweaks.
--
-- The explorer is a picker in disguise, so "the search input" is the picker's
-- `input` window. Hiding it is a layout option, not a picker option:
--   https://github.com/folke/snacks.nvim/blob/main/docs/picker.md
return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = {
            -- don't show the search/filter input on open
            hidden = { "input" },
            -- override the sidebar preset's box width (defaults to 40);
            -- the box spec lives one level deeper under `layout`
            layout = {
              width = 30,
              min_width = 30,
            },
          },
        },
      },
    },
  },
}

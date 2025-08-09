return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.autotag = {
      enable = true,
      filetypes = {
        "html",
        "xml",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "vue",
        "svelte",
        "tsx",
        "jsx",
        "bash",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "vim",
        "yaml",
      },
    }
  end,
}

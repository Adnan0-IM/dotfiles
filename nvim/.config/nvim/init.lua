-- bootstrap lazy.nvim, LazyVim and your 'plugins'
require("config.lazy")

if vim.g.vscode then
  -- Basic options
  vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
  vim.opt.inccommand = "split"
  vim.opt.ignorecase = true
  vim.opt.smartcase = true

  -- Show mode in status bar (VSCode setting also required)
  vim.opt.showmode = true

  -- =======================
  -- KEYMAPS
  -- =======================
  local set = vim.keymap.set

  -- Move lines up/down
  set("n", "<A-j>", ":m .+1<CR>==", { silent = true })
  set("n", "<A-k>", ":m .-2<CR>==", { silent = true })
  set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { silent = true })
  set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { silent = true })
  set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true })
  set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true })

  -- Shift+O and o stay functional in VSCode
  set("n", "o", "o<Esc>", { silent = true })
  set("n", "O", "O<Esc>", { silent = true })

  -- Insert mode quick escape
  vim.schedule(function()
    set("i", "jk", "<Esc>", { silent = true })
  end)

  -- =======================
  -- DISABLE YANK MESSAGES
  -- =======================
  -- Works in VSCode if "vscode-neovim.useMessageProvider" = false in settings.json
  vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() end, -- do nothing
  })

  -- =======================
  -- QUICK SAVE / QUIT
  -- =======================
  set("n", "<C-s>", ":w<CR>", { silent = true })
  set("i", "<C-s>", "<Esc>:w<CR>", { silent = true })
  set("n", "<C-q>", ":q<CR>", { silent = true })
  set("n", "<C-S-q>", ":q!<CR>", { silent = true })
end

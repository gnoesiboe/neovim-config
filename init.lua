-- Needs to be set before require
vim.g.colorscheme = "catppuccin"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Line numbers without relative numbering (easier to read for most people)
vim.opt.number = true
vim.opt.relativenumber = false

-- Smart case-insensitive search (lowercase = ignore case, uppercase = match case)
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Prefer indentation for all
vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4
vim.opt_local.softtabstop = 4
vim.opt_local.expandtab = true

-- Enable 24-bit RGB colors (makes themes look much better)
vim.opt.termguicolors = true

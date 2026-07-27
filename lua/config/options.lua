-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_php_lsp = "intelephense"

-- Enable the option to require a Prettier config file
-- If no prettier config file is found, the formatter will not be used
vim.g.lazyvim_prettier_needs_config = false

-- Global indentation settings
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.tabstop = 4 -- Number of spaces tabs count for
vim.opt.softtabstop = 4 -- Number of spaces for <Tab>/<BS>

-- Ensure the git directory is used to determine the root directory
vim.g.root_spec = { { ".git", "lua" }, "lsp", "cwd" }

-- Disable AI inline completions as they are often really bad
-- vim.g.ai_cmp = false

-- Enable spelling check by default
vim.opt.spell = true
vim.opt.spelllang = { "en_us", "nl" }

-- For Neovide
vim.opt.linespace = 14
vim.opt.guifont = "JetBrains Mono:h12"
vim.g.neovide_opacity = 0.95
vim.g.neovide_normal_opacity = 0.95

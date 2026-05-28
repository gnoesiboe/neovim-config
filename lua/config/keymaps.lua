-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Alternative naviation for beginning and end of line, as $ and ^ is awkward to reach
vim.keymap.set({ "n", "v" }, "gh", "^", { desc = "Go to first non-blank character of line" })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "Go to end of line" })

-- Way to toggle diagnostics to show only errors or all (errors + warnings)
local diag = vim.diagnostic
local ERROR = diag.severity.ERROR
local show_only_errors = false
vim.keymap.set("n", "<leader>td", function()
    show_only_errors = not show_only_errors

    if show_only_errors then
        diag.config({
            virtual_text = { severity = ERROR },
            signs = { severity = ERROR },
            underline = { severity = ERROR },
            float = { severity = ERROR },
        })
        vim.notify("Diagnostics: errors only", vim.log.levels.INFO)
    else
        diag.config({
            virtual_text = true,
            signs = true,
            underline = true,
            float = true,
        })
        vim.notify("Diagnostics: errors + warnings", vim.log.levels.INFO)
    end
end, { desc = "Toggle diagnostic severity (errors only)" })

-- Always ensure that, when moving up and down, the screen stays centered around it
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Don't but deletes in clipboard
vim.keymap.set({ "n", "v" }, "d", [["_d]], { noremap = true })
vim.keymap.set({ "n", "v" }, "D", [["_D]], { noremap = true })
vim.keymap.set("n", "dd", [["_dd]], { noremap = true })

-- Write buffer and delete it in one go
vim.keymap.set("n", "<leader>wd", "<cmd>w<cr><cmd>bd<cr>", { desc = "Write and delete buffer" })

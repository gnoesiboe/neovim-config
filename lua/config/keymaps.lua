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

-- Don't but deletes in clipboard
vim.keymap.set({ "n", "v" }, "d", [["_d]], { noremap = true })
vim.keymap.set({ "n", "v" }, "D", [["_D]], { noremap = true })
vim.keymap.set("n", "dd", [["_dd]], { noremap = true })
vim.keymap.set("n", "x", '"_x', { desc = "Delete char without yanking" })

-- Write buffer and delete it in one go
vim.keymap.set("n", "<leader>wd", "<cmd>w<cr><cmd>bd<cr>", { desc = "Write and delete buffer" })

-- For Neovide, as not using Kitty there
if vim.g.neovide then
    local function save()
        vim.cmd.write()
    end
    local function copy()
        vim.cmd([[normal! "+y]])
    end
    local function paste()
        vim.api.nvim_paste(vim.fn.getreg("+"), true, -1)
    end

    vim.keymap.set({ "n", "i", "v" }, "<D-s>", save, { desc = "Save" })
    vim.keymap.set("v", "<D-c>", copy, { silent = true, desc = "Copy" })
    vim.keymap.set({ "n", "i", "v", "c", "t" }, "<D-v>", paste, { silent = true, desc = "Paste" })

    -- Make moving lines up an dodwn work in Neovide
    vim.g.neovide_input_macos_option_key_is_meta = "only_left"
end

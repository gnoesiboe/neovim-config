return {
    -- No plugin needed — pure Lua toggle between source and spec files
    {
        "folke/lazy.nvim", -- dummy anchor so LazyVim loads this file
        init = function()
            vim.keymap.set("n", "<leader>gt", function()
                local file = vim.fn.expand("%:p") -- full path
                local root = vim.fn.expand("%:p:r") -- path without extension
                local ext = vim.fn.expand("%:e") -- extension (ts, js, etc.)

                if file:match("%.spec%.[tj]s$") then
                    -- currently in a spec file → go to source
                    local src = file:gsub("%.spec%.([tj]s)$", ".%1")
                    vim.cmd("edit " .. src)
                else
                    -- currently in a source file → go to spec
                    vim.cmd("edit " .. root .. ".spec." .. ext)
                end
            end, { desc = "Toggle source/spec file" })
        end,
    },
}

return {
    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            -- Helper to get the root/project folder name
            local function project_name()
                local root = vim.fn.getcwd()
                return vim.fn.fnamemodify(root, ":t")
            end

            -- Don't show current branch
            opts.sections.lualine_b = {
                project_name,
            }

            -- Show full path instead of truncated one
            opts.sections.lualine_c = {
                {
                    "filename",
                    path = 3, -- full absolute path (uses ~ for root)
                    shorting_target = 0, -- disables automatic shortening
                },
            }
        end,
    },
}

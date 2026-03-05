return {
    {
        "nvim-lualine/lualine.nvim",
        opts = function(_, opts)
            -- Helper to get the root/project folder name
            local function project_name()
                return vim.fn.fnamemodify(LazyVim.root(), ":t")
            end

            opts.sections.lualine_b = {
                project_name, -- Project name added
                "branch", -- Quote out to hide current git brnach
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

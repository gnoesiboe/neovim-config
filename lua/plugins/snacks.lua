-- Disable snacks explorer in favor of yazi
return {
    "folke/snacks.nvim",
    -- keys = {
    --     { "<leader>e", false },
    --     { "<leader>E", false },
    -- },
    opts = {
        -- explorer = {
        --     enabled = false,
        -- },
        picker = {
            sources = {
                grep = {
                    layout = "ivy", -- or "telescope", "default"
                },
                explorer = {
                    -- Show explorer as modal instead of sidebar
                    -- layout = { preset = "default", preview = true },
                    auto_close = true, -- 👈 closes after selecting a file

                    -- Change width of explorer
                    -- layout = "ivy",
                    layout = {
                        layout = {
                            width = 70, -- set your desired width here
                            min_width = 70, -- optional: prevent it from going narrower
                        },
                    },
                },
            },

            formatters = {
                file = {
                    filename_first = true, -- show filename before line content, which results in them being grouped by file
                },
            },
        },
    },
}

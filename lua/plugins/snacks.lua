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
                explorer = {
                    -- Show explorer as modal instead of sidebar
                    layout = { preset = "default", preview = true },
                    auto_close = true, -- 👈 closes after selecting a file
                },
            },
        },
    },
}

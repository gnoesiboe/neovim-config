return {
    -- Tool to show in which mode you are in (normal, insert, visual, etc)
    {
        "mvllow/modes.nvim",
        tag = "v0.3.0",
        config = function()
            require("modes").setup()
        end,
    },
}

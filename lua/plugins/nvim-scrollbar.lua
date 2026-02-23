return {
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup({
                handle = {
                    blend = 0,
                },
            })
        end,
    },
}

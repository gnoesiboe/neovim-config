return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        build = ":Copilot auth",
        config = function()
            require("copilot").setup({
                -- Recommended to be disabled, as handled by nvim-cmp
                suggestion = { enabled = false },
                panel = { enabled = false }, --

                -- Use node v22+, as this is required by Copilot, but not available in all repos
                copilot_node_command = "/Users/gijsnieuwenhuis/.asdf/installs/nodejs/22.13.0/bin/node",
            })
        end,
    },
}

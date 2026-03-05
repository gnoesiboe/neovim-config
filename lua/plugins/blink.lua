return {
    "saghen/blink.cmp",
    opts = {
        keymap = {
            preset = "default", -- start from the default preset

            -- Make selecting autocomplete results consistent with the picker
            ["<C-j>"] = { "select_next", "fallback" },
            ["<C-k>"] = { "select_prev", "fallback" },

            -- Accept current selection with ENTER, but ensure no additional new line is added afterwards
            ["<CR>"] = { "accept", "fallback" },

            -- When pressing escape, close autocomplete widget without accepting
            -- ["<Esc>"] = { "cancel", "fallback" },
        },

        sources = {
            default = { "lsp", "copilot", "path", "snippets", "buffer" },
            providers = {
                copilot = {
                    name = "copilot",
                    module = "blink-copilot",
                    score_offset = -1, -- Push copilot results lower
                    async = true,
                },
            },
        },
    },
}

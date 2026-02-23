return {
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            autoformat = true,
            servers = {
                phpactor = false,
                intelephense = {
                    settings = {
                        intelephense = {
                            format = {
                                braces = "k&r",
                            },
                            -- Below seems to help with rename functionality
                            files = {
                                maxSize = 1000000,
                            },
                        },
                    },
                },
            },
        },
    },

    -- add symbols-outline
    {
        "git@github.com:h3pei/copy-file-path.nvim.git",
    },

    -- Add plugin to surround selected text with something
}

-- Show signature help when you construct a class or provide function arguments
return {
    "ray-x/lsp_signature.nvim",
    event = "InsertEnter",
    opts = {
        bind = true,
        handler_opts = {
            border = "rounded",
        },
        floating_window = true,
        hint_enable = true,
        hi_parameter = "LspSignatureActiveParameter",
    },
}

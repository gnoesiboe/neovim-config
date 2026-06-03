-- As we are using php-cs-fixer, and not phpcs, I used to get annoying warnings about PHP lines being more than 120 characters
-- that php-cs-fixer was not auto fixing. This ensures that PHPCS is not installed.
return {
    {
        "mason-org/mason.nvim",
        opts = function(_, opts)
            opts.ensure_installed = vim.tbl_filter(function(v)
                return v ~= "phpcs"
            end, opts.ensure_installed or {})
        end,
    },
    {
        "mfussenegger/nvim-lint",
        opts = function(_, opts)
            opts.linters_by_ft = opts.linters_by_ft or {}
            opts.linters_by_ft.php = vim.tbl_filter(function(v)
                return v ~= "phpcs"
            end, opts.linters_by_ft.php or {})
        end,
    },
}

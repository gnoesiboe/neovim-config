-- Plugin that shows code structure outline in the right sidebar with `<space> c s`
return {
    "stevearc/aerial.nvim",
    opts = {
        filter_kind = {
            "Class",
            "Constructor",
            "Function",
            "Interface",
            "Method",
            -- "Enum",
            -- "Module",
            -- "Struct",
        },
    },
}

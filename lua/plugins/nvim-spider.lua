return {
    "chrisgrieser/nvim-spider",
    --     -- This plugin allows be to use the word keys to jump between parts of words instead of entire words
    keys = {
        { "w", "<cmd>lua require('spider').motion('w')<CR>", mode = { "n", "o", "x" } },
        { "e", "<cmd>lua require('spider').motion('e')<CR>", mode = { "n", "o", "x" } },
        { "b", "<cmd>lua require('spider').motion('b')<CR>", mode = { "n", "o", "x" } },
        { "ge", "<cmd>lua require('spider').motion('ge')<CR>", mode = { "n", "o", "x" } },
    },
    opts = {
        skipInsignificantPunctuation = false,
    },
}

return {
    {"echasnovski/mini.pairs",enabled=false},
    {"echasnovski/mini.ai",enabled=false},
    {"echasnovski/mini.comment",enabled=false},
    {"echasnovski/mini.surround",enabled=false},
    {
        "folke/noice.nvim",
        enabled = false,
        config = function()
            require("noice").setup({
                presets = {
                    bottom_search = true,
                    command_palette = true,
                    inc_rename = true,
                }
            })
        end,
    },
}
local M = {}

function M.setup()
    -- local g = vim.g
    -- g.indent_blankline_filetype_exclude = { 
    --     "help",
    --     "startify",
    --     "aerial",
    --     "alpha",
    --     "dashboard",
    --     "packer",
    --     "neogitstatus",
    --     "NvimTree",
    --     "neo-tree",
    --     "Trouble", 
    -- }
    -- g.indent_blankline_buftype_exclude = { "terminal", "nofile" }
    -- g.indent_blankline_show_trailing_blankline_indent = false
    require("indent_blankline").setup {
        -- show_current_context = true,
        char = "▏",
        context_char = "▏",
        -- show_current_context_start = true,
        use_treesitter = true,
        show_trailing_blankline_indent = false,
        buftype_exclude = { "terminal", "nofile" },
        filetype_exclude = {
            "help",
            "startify",
            "aerial",
            "alpha",
            "dashboard",
            "packer",
            "neogitstatus",
            "NvimTree",
            "neo-tree",
        },
        context_patterns = {
            "class",
            "return",
            "function",
            "method",
            "^if",
            "^while",
            "jsx_element",
            "^for",
            "^object",
            "^table",
            "block",
            "arguments",
            "if_statement",
            "else_clause",
            "jsx_element",
            "jsx_self_closing_element",
            "try_statement",
            "catch_clause",
            "import_statement",
            "operation_type",
        },
    }
end

return M

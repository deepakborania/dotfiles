return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "bash",
                "c",
                "cpp",
                "go",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "regex",
                "ruby",
                "rust",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = "<C-s>",
                    node_decremental = "<bs>",
                },
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ['aa'] = '@parameter.outer',
                        ['ia'] = '@parameter.inner',
                        ['af'] = '@function.outer',
                        ['if'] = '@function.inner',
                        ['ac'] = '@class.outer',
                        ['ic'] = '@class.inner',
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- whether to set jumps in the jumplist
                    goto_next_start = {
                      [']m'] = '@function.outer',
                      [']]'] = '@class.outer',
                    },
                    goto_next_end = {
                      [']M'] = '@function.outer',
                      [']['] = '@class.outer',
                    },
                    goto_previous_start = {
                      ['[m'] = '@function.outer',
                      ['[['] = '@class.outer',
                    },
                    goto_previous_end = {
                      ['[M'] = '@function.outer',
                      ['[]'] = '@class.outer',
                    },
                },
            },
        },
    },
}
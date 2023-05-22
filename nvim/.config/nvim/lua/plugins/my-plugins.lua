return{
    {
        'j-hui/fidget.nvim',
        config = function()
            require('fidget').setup{}
        end,
    },

    {
        "telescope.nvim",
        dependencies = {
          "nvim-telescope/telescope-fzf-native.nvim",
          build = "make",
          config = function()
            require("telescope").load_extension("fzf")
          end,
        },
    },

    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
        opts = {
          -- add your options that should be passed to the setup() function here
          position = "right",
        },
    },

    { "lukas-reineke/indent-blankline.nvim", opts = { char = "┊" }},
    { "echasnovski/mini.indentscope", opts = { symbol = "┊", } },
    {
        "zbirenbaum/copilot.lua",
        -- cmd = "Copilot",
        build = ":Copilot auth",
        opts = {
          suggestion = { enabled = true, auto_trigger = true },
        --   panel = { enabled = false },
        },
    },
    {
      'windwp/nvim-autopairs',
      event = "VeryLazy",
      config = function() require("nvim-autopairs").setup {} end
    },
    {
      'numToStr/Comment.nvim',
      event = "BufEnter",
      config = function()
          require('Comment').setup()
      end
    },
    {'tpope/vim-sleuth'},
    {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      config = function()
          require("nvim-surround").setup({})
      end
    },
}
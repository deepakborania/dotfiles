local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins`
  local function plugins(use)
    use { "wbthomason/packer.nvim" }
    use "lewis6991/impatient.nvim"

    -- Load only when require
    use { "nvim-lua/plenary.nvim", module = "plenary" }
    use({ "projekt0n/github-nvim-theme",
      config = function()
        require('github-theme').setup({
          theme_style = "dark_default"
        })
      end
    })

    -- Better icons
    use {
      "kyazdani42/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    use {
      'akinsho/bufferline.nvim', tag = "v3.*", 
      requires = 'kyazdani42/nvim-web-devicons',
      event = "UIEnter",
      config = function() 
        require("config.bufferline").setup()
      end,
    }

    use { 
      "nvim-telescope/telescope.nvim" , tag = "0.1.0",
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('telescope').setup {
          extensions = {
            fzf = {
              fuzzy = true,                    -- false will only do exact matching
              override_generic_sorter = true,  -- override the generic sorter
              override_file_sorter = true,     -- override the file sorter
              case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                               -- the default case_mode is "smart_case"
            }
          }
        }
        require('telescope').load_extension('fzf')
      end
    }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

    -- User interface
    use {
      "stevearc/dressing.nvim",
      event = "BufEnter",
      config = function()
        require("dressing").setup {
          input = {
            default_prompt = "➤ ",
            winhighlight = "Normal:Normal,NormalNC:Normal",
          },
          select = {
            backend = { "telescope", "fzf", "builtin" },
            builtin = { winhighlight = "Normal:Normal,NormalNC:Normal" }, 
          },
        }
      end,
    }

    -- nvim-tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
      cmd = { "NvimTreeToggle", "NvimTreeClose" },
      config = function()
        require("config.nvimtree").setup()
      end,
    }

    use {
      "akinsho/toggleterm.nvim", tag = '*',
      cmd = "ToggleTerm",
      config = function()
        require("config.toggleterm")
      end,
    }

    -- Startup screen
    -- use {
    --   "goolord/alpha-nvim",
    --   config = function()
    --     require("config.alpha").setup()
    --   end,
    -- }

    use {
      'mhinz/vim-startify',
      config = function()
        require("config.startup-screen").setup()
        -- require("vim-startify").setup()
      end,
    }

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      event = "BufEnter",
      config = function()
        require("Comment").setup {}
      end,
    }

    -- IndentLine
    use {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufReadPre",
      config = function()
        require("config.indentblankline").setup()
      end,
    }

    -- Which key
    use {
      "folke/which-key.nvim",
      event = "VimEnter",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    use {
      'lewis6991/gitsigns.nvim',
      event = "BufEnter",
      config = function()
        require('gitsigns').setup()
      end
    }

    -- Lualine status
    use {
      "nvim-lualine/lualine.nvim",
      -- after = "nvim-treesitter",
      config = function()
        require("config.lualine") --.setup()
      end,
      requires = { "nvim-web-devicons" },
    }

    use {
      "nvim-treesitter/nvim-treesitter",
      -- opt = true,
      run = ":TSUpdate",
      event = "BufRead",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {
        { "nvim-treesitter/nvim-treesitter-textobjects" },
      },
    }

    use { "williamboman/mason.nvim" }
    use {
      "williamboman/mason-lspconfig.nvim",
      after = "mason.nvim"
    }
    use {
      "neovim/nvim-lspconfig",
      after = "mason-lspconfig.nvim",
      opt = true,
      event = "BufReadPre",
      config = function()
        require("config.lsp").setup()
      end,
    }

    use {
      "jose-elias-alvarez/null-ls.nvim",
      after = "mason.nvim",
      -- event = "BufReadPre",
      -- config = function()
      --   require("config.null-ls").setup()
      -- end
    }
    use{
      "jayp0521/mason-null-ls.nvim",
      after = "mason.nvim",
    }
    -- use({
    --   "jose-elias-alvarez/null-ls.nvim",
    --   config = function()
    --       require("null-ls").setup()
    --   end,
    --   requires = { "nvim-lua/plenary.nvim" },
    -- })

    use {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      opt = true,
      config = function()
        require("config.cmp").setup()
      end,
      wants = { "LuaSnip" },
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "onsails/lspkind.nvim",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lua",
        "ray-x/cmp-treesitter",
        "hrsh7th/cmp-cmdline",
        "saadparwaiz1/cmp_luasnip",
        {
          "L3MON4D3/LuaSnip",
          wants = "friendly-snippets",
          config = function()
            require("config.luasnip").setup()
          end,
        },
        "rafamadriz/friendly-snippets",
        disable = false,
      },
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M

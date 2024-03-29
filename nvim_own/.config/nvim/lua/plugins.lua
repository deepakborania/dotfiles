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

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Load only when require
    use { "nvim-lua/plenary.nvim", module = "plenary" }

    -- Colorscheme
    -- use {
    --     "sainnhe/everforest",
    --     config = function()
    --         vim.cmd "colorscheme everforest"
    --     end,
    -- }
    use { 
        "ellisonleao/gruvbox.nvim",
        config = function()
            vim.cmd "colorscheme gruvbox"
        end,
    }

    -- Startup screen
    use {
        "goolord/alpha-nvim",
        config = function()
          require("config.alpha").setup()
        end,
    }

    -- Git
    use {
        "TimUntersberger/neogit",
        cmd = "Neogit",
        requires = "nvim-lua/plenary.nvim",
        config = function()
          require("config.neogit").setup()
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

    -- IndentLine
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
        config = function()
          require("config.indentblankline").setup()
        end,
    }

    -- Better icons
    use {
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons",
        config = function()
          require("nvim-web-devicons").setup { default = true }
        end,
    }

    -- Better Comment
    use {
        "numToStr/Comment.nvim",
        opt = true,
        keys = { "gc", "gcc", "gbc" },
        config = function()
          require("Comment").setup {}
        end,
    }

    -- Motions
    use { "andymass/vim-matchup", event = "CursorMoved" }
    use { "wellle/targets.vim", event = "CursorMoved" }
    use { "unblevable/quick-scope", event = "CursorMoved", disable = false }
    use { "chaoren/vim-wordmotion", opt = true, fn = { "<Plug>WordMotion_w" } }

    -- Easy hopping
    use {
        "phaazon/hop.nvim",
        cmd = { "HopWord", "HopChar1" },
        config = function()
          require("hop").setup {}
        end,
    }

    -- Easy motion
    use {
        "ggandor/lightspeed.nvim",
        keys = { "s", "S", "f", "F", "t", "T" },
        config = function()
            require("lightspeed").setup {}
        end,
    }

    -- Markdown
    use {
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
        cmd = { "MarkdownPreview" },
    }

    -- Lualine status
    use {
        "nvim-lualine/lualine.nvim",
        after = "nvim-treesitter",
        config = function()
         require("config.lualine").setup()
        end,
        requires = { "nvim-web-devicons" },
    }

    -- nvim-gps
    use {
        "SmiteshP/nvim-gps",
        requires = "nvim-treesitter/nvim-treesitter",
        module = "nvim-gps",
        config = function()
            require("nvim-gps").setup()
        end,
    }
    
    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        opt = true,
        event = "BufRead",
        run = ":TSUpdate",
        config = function()
            require("config.treesitter").setup()
        end,
        requires = {
            { "nvim-treesitter/nvim-treesitter-textobjects" },
        },
    }

    -- FZF
    -- use { "junegunn/fzf" }
    -- use { "junegunn/fzf.vim", event = "BufEnter" }

    -- FZF Lua
    use {
        "ibhagwan/fzf-lua",
        event = "BufEnter",
        requires = {
            "kyazdani42/nvim-web-devicons",
        },
        config = function()
            require('fzf-lua').setup{
                fzf_opts = {
                    ['--layout'] = false,
                }
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

    -- Buffer line
    use {
        "akinsho/nvim-bufferline.lua",
        event = "BufReadPre",
        wants = "nvim-web-devicons",
        config = function()
          require("config.bufferline").setup()
        end,
    }

    -- User interface
    use {
        "stevearc/dressing.nvim",
        event = "BufEnter",
        config = function()
          require("dressing").setup {
            select = {
              backend = { "telescope", "fzf", "builtin" },
            },
          }
        end,
    }

    -- Telescope
    use { 
        "nvim-telescope/telescope.nvim" ,
        -- opt = true,
        -- event = "BufWinEnter",
    }
    -- Telescope Extensions
    use {
        "nvim-telescope/telescope-project.nvim",
        event = "BufWinEnter",
        config = function()
          require"telescope".load_extension("project")
        end,
    }

    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'

    -- Debugging
    -- use 'nvim-lua/plenary.nvim'
    use 'mfussenegger/nvim-dap'

    -- Completion
    use {
        "ms-jpq/coq_nvim",
        branch = "coq",
        event = "InsertEnter",
        opt = true,
        run = ":COQdeps",
        config = function()
          require("config.coq").setup()
        end,
        requires = {
          { "ms-jpq/coq.artifacts", branch = "artifacts" },
          { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
        },
        disable = false,
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

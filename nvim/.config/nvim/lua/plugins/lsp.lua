return{
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- autoformat = false,
    }
  },
  {
      "williamboman/mason.nvim",
      opts = {
        ensure_installed = {
          "stylua",
          "shellcheck",
          "shfmt",
          "gopls",
          "rust-analyzer",
        },
      },
    },

  -- {
  --     "nvimtools/none-ls.nvim",
  --     event = { "BufReadPre", "BufNewFile" },
  --     dependencies = { "mason.nvim" },
  --     opts = function()
  --         local nls = require("null-ls")
  --         return {
  --         root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
  --         sources = {
  --             nls.builtins.formatting.stylua,
  --             nls.builtins.formatting.shfmt,
  --             nls.builtins.formatting.prettier,
  --             nls.builtins.formatting.goimports,
  --             nls.builtins.formatting.black,
  --             -- nls.builtins.formatting.rustfmt,
  --         },
  --         }
  --     end,
  -- },
  {
    "simrat39/rust-tools.nvim",
    event = "BufReadPre",
    dependencies = {"neovim/nvim-lspconfig"},
    config = function(_, opts)
      local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.9.0/'
      local codelldb_path = extension_path .. 'adapter/codelldb'
      local liblldb_path = extension_path .. 'lldb/lib/liblldb.dylib'  -- MacOS: This may be .dylib

      -- table.insert(opts, {
      --     -- ... other configs
      --     dap = {
      --         adapter = require('rust-tools.dap').get_codelldb_adapter(
      --             codelldb_path, liblldb_path)
      --     }
      -- })
      
      local opts = {
          -- ... other configs
          dap = {
              adapter = require('rust-tools.dap').get_codelldb_adapter(
                  codelldb_path, liblldb_path)
          }
      }
      require("rust-tools").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "BufReadPre",
    config = function()
      -- local dap = require("dap")
      -- dap.adapters.go = {
      --   type = "executable",
      --   command = "node",
      --   args = {os.getenv("HOME") .. "/.vscode/extensions/golang.go-0.27.1/dist/debugAdapter.js"},
      -- }
      -- dap.configurations.go = {
      --   {
      --     type = "go",
      --     name = "Debug",
      --     request = "launch",
      --     showLog = false,
      --     program = "${file}",
      --     dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
      --   },
      -- }
      -- dap.adapters.cpp = {
      --   type = 'executable',
      --   command = 'lldb-vscode', -- my binary was called 'lldb-vscode-11'
      --   name = "lldb"
      -- }
      -- dap.configurations.cpp = {
      --   {
      --     name = "Launch",
      --     type = "cpp",
      --     request = "launch",
      --     program = function()
      --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      --     end,
      --     cwd = '${workspaceFolder}',
      --     stopOnEntry = false,
      --     args = {},
      --     runInTerminal = false,
      --   },
      -- }
      local dap, dapui = require("dap"), require("dapui")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  { 
    "rcarriga/nvim-dap-ui",
    event = "BufReadPre",
    lazy = true,
    -- dependencies = {"mfussenegger/nvim-dap"},
    config = function()
      require("dapui").setup()
    end,
  },
  { 
    "leoluz/nvim-dap-go",
    event = "BufReadPre",
    config = function()
      require("dap-go").setup()
    end,
  },
  { 
    "theHamsta/nvim-dap-virtual-text",
    event = "BufReadPre",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  },
}
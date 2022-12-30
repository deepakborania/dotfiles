local M = {}

function M.setup()
  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "clangd",
      "gopls",
      "solargraph",
      "rust_analyzer",
      "sumneko_lua",
      "taplo",
      "terraformls",
      "yamlls",
    },
  })

  local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
  if not lspconfig_status_ok then
    vim.notify("Couldn't load LSP-Config" .. lspconfig, "error")
    return
  end

  local opts = {
    on_attach = require("config.lsp.lsp-config").on_attach,
    -- capabilities = require("lspconfig").capabilities,
  }

  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { noremap = true, silent = true })
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true })
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap = true, silent = true })

  require("mason-lspconfig").setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
      lspconfig[server_name].setup {
        on_attach = opts.on_attach,
        -- capabilities = opts.capabilities,
      }
    end,
    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
    -- ["solargraph"] = function ()
    --     lspconfig.solargraph.setup {
    --       settings = {

    --       },
    --     }
    --     on_attach = opts.on_attach,
    -- end
  }
  -- require("lspconfig").setup {

  -- }

  local null_ls = require 'null-ls'

  require ('mason-null-ls').setup({
      ensure_installed = {'goimports', 'jq'}
  })

  require 'mason-null-ls'.setup_handlers {
      function(source_name)
        -- all sources with no handler get passed here
      end,
      -- stylua = function()
      --   null_ls.register(null_ls.builtins.formatting.stylua)
      -- end,
      jq = function()
        null_ls.register(null_ls.builtins.formatting.jq)
      end
  }

  -- will setup any installed and configured sources above
  null_ls.setup()
end

return M


local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single", -- none, single, double, shadow
      position = "bottom", -- bottom, top
    },
  }

  local opts = {
    mode = "n", -- Normal mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = false, -- use `nowait` when creating keymaps
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    q = {
        name = "Quit", 
        q = { "<cmd>q<CR>", "Quit" },
        Q = { "<cmd>q!<CR>", "Quit" },
    },

    b = {
      name = "Buffer",
      b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
      c = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    },

    f = {
        name = "Find",
        t = { "<cmd>NvimTreeToggle<cr>", "Tree Explorer" },
        -- f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
        f = { "<cmd>FzfLua files<cr>", "Files" },
        r = { "<cmd>FzfLua oldfiles<cr>", "Old files" },
        g = { "<cmd>FzfLua live_grep<cr>", "Live grep" },
        c = { "<cmd>FzfLua commands<cr>", "Commands" },
        -- r = { "<cmd>Rg<cr>", "RipGrep" },
    },

    p = {
        name = "Project",
        a = {  "<cmd>Telescope project project{}<cr><esc>c<cr>", "Add Project" },
        p = {  "<cmd>Telescope project project<cr>", "List Projects" },
    },

    s = {
        name = "Search",
        f = { "<cmd>FzfLua lgrep_curbuf<cr>", "Live grep current buffer" },
        F = { "<cmd>FzfLua lgrep_curbuf<cr>", "Grep current buffer" },
        p = { "<cmd>FzfLua live_grep<cr>", "Live grep project" },
        P = { "<cmd>FzfLua live_grep<cr>", "Grep project" },
        r = { "<cmd>FzfLua resume<cr>", "Resume Search" },
    },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
      p = { "<cmd>PackerProfile<cr>", "Profile" }
    },

    -- g = {
    --   name = "Git",
    --   s = { "<cmd>Neogit<CR>", "Status" },
    -- },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
local M = {}

function M.setup()
  local whichkey = require "which-key"
  local builtin = require('telescope.builtin')
  local Terminal  = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({ 
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
      border = "double",
    },
  --    -- function to run on opening the terminal
  -- on_open = function(term)
  --   vim.cmd("startinsert!")
  --   vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  -- end,
  -- -- function to run on closing the terminal
  -- on_close = function(term)
  --   vim.cmd("startinsert!")
  -- end,
    -- hidden = true,
    
  })
  function _lazygit_toggle()
    lazygit:toggle()
  end

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

    b = {
      name = "Buffer",
      b = { builtin.buffers, "Buffers" },
      d = { "<Cmd>bd!<Cr>", "Close current buffer" },
      D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
      n = { "<cmd>bnext<cr>", "Next Buffer" },
      p = { "<cmd>bprevious<cr>", "Previous Buffer" },
    },

    c = {
      name = "Code",
      d = { builtin.lsp_definitions, "Definitions" },
      i = { builtin.lsp_implementations, "Implementations" },
      m = { builtin.lsp_incoming_calls, "Incoming Calls" },
      o = { builtin.lsp_outgoing_calls, "Outgoing Calls" },
      r = { builtin.lsp_references, "References" },
      s = { builtin.lsp_document_symbols, "Buffer Symbols" },
      S = { builtin.lsp_workspace_symbols, "Workspace Symbols" },
      t = { builtin.lsp_type_definitions, "Type Definitions" },
    },

    f = {
        name = "Find",
        -- t = { "<cmd>NvimTreeToggle<cr>", "Tree Explorer" },
        -- f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
        b = { builtin.buffers, "Buffers"},
        c = { builtin.commands, "Commands" },
        f = { builtin.find_files, "Files" },
        -- g = { builtin.live_grep, "Live grep" },
        o = { builtin.oldfiles, "Old files" },
        -- r = { "<cmd>Rg<cr>", "RipGrep" },
    },

    g = {
      name = "Git",
      b = { builtin.git_bcommits, "Buffer Commits" },
      c = { builtin.git_commits, "Commits" },
      g = { "<cmd>lua _lazygit_toggle()<CR>", "ToggleTerm lazygit"},
      d = { function() require("gitsigns").diffthis() end, "View git diff" },
      j = { function() require("gitsigns").next_hunk() end, "Next git hunk" },
      k = { function() require("gitsigns").prev_hunk() end, "Previous git hunk" },
      l = { function() require("gitsigns").blame_line() end, "Git blame" },
      p = { function() require("gitsigns").preview_hunk() end, "Preview git hunk" },
      s = { function() require("gitsigns").stage_hunk() end, "Stage git hunk" },
      u = { function() require("gitsigns").undo_stage_hunk() end, "Unstage git hunk" },
      h = { function() require("gitsigns").reset_hunk() end, "Reset git hunk" },
      r = { function() require("gitsigns").reset_buffer() end, "Reset git buffer" },
    },

    ["h"] = { "<cmd>nohlsearch<cr>", "No Highlight" },

    o = {
      o = { "<cmd>NvimTreeFocus<cr>", "Toggle Focus"},
      t = { "<cmd>NvimTreeToggle<cr>", "Toggle Explorer"},
    },
    -- p = {
    --     name = "Project",
    --     a = {  "<cmd>Telescope project project{}<cr><esc>c<cr>", "Add Project" },
    --     p = {  "<cmd>Telescope project project<cr>", "List Projects" },
    -- },

    q = {
      name = "Quit", 
      q = { "<cmd>q<CR>", "Quit" },
      Q = { "<cmd>q!<CR>", "Quit" },
    },

    s = {
        name = "Search",
        b = { builtin.current_buffer_fuzzy_find, "Fuzzy-find Buffer"},
        g = { builtin.grep_string, "Grep string in project"},
        h = { builtin.search_history, "Search History" },
        -- f = { "<cmd>FzfLua lgrep_curbuf<cr>", "Live grep current buffer" },
        -- F = { "<cmd>FzfLua lgrep_curbuf<cr>", "Grep current buffer" },
        p = { builtin.live_grep, "Live grep project" },
        -- P = { "<cmd>FzfLua live_grep<cr>", "Grep project" },
        -- r = { "<cmd>FzfLua resume<cr>", "Resume Search" },
        s = { builtin.treesitter, "Treesitter Symbols"}
    },

    z = {
      name = "Misc",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
      p = { "<cmd>PackerProfile<cr>", "Profile" },

      k = { builtin.keymaps, "Keymaps"},
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
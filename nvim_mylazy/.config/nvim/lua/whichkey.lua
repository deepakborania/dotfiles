local M = {}

function M.setup()

    local wk = require("which-key")
    local Util = require("util")
    local opts = {
      prefix = "<leader>",
    }
    
    local mappings = {
      ["<space>"] = { Util.telescope("files"), "Find Files" },
      [","] = { "<cmd>Telescope buffers show_all_buffers=true<cr>", "Switch Buffer" },
      [":"] = { require('telescope.builtin').command_history, "Command History" },
      ["/"] = { Util.telescope("live_grep"), 'Find in Files (Grep)'},

      g ={
        name = "Git",
        b = { require('telescope.builtin').git_branches, "Branches" },
        c = { require('telescope.builtin').git_bcommits, "Commits" },
        C = { require('telescope.builtin').git_commits, "Commits" },
        d = { require('telescope.builtin').git_status, "Diff" },
        f = { require('telescope.builtin').git_files, "Files" },
        l = { require('telescope.builtin').git_bcommits, "Log" },
        L = { require('telescope.builtin').git_commits, "Log" },
        s = { require('telescope.builtin').git_status, "Status" },
        t = { require('telescope.builtin').git_bcommits, "Tags" },
        T = { require('telescope.builtin').git_commits, "Tags" },
      },

      q = {
        name = "Quit", 
        a = { "<cmd>qa<CR>", "Quit All" },
        A = { "<cmd>qa!<CR>", "Quit All (without saving)" },
        q = { "<cmd>q<CR>", "Quit" },
        Q = { "<cmd>q!<CR>", "Quit (without saving)" },
        s = { function() require("persistence").load() end, "Restore Session" },
        l = { function() require("persistence").load({ last = true }) end, "Restore Last Session" },
        d = { function() require("persistence").stop() end, "Don't Save Current Session" },
      },

      s = {
        name = "Search",
        a = { require('telescope.builtin').autocommands,  'Autocommands' },
        b = { require('telescope.builtin').buffers,       'Buffers' },
        c = { require('telescope.builtin').commands,      'Commands' },
        d = { require('telescope.builtin').diagnostics,   'Diagnostics' },
        f = { require('telescope.builtin').find_files,    'Files' },
        g = { Util.telescope("live_grep"),                'Grep (root dir)' },
        G = { Util.telescope("live_grep", {cwd = false}), 'Grep (cwd)' },
        h = { require('telescope.builtin').help_tags,     'Help' },
        k = { require('telescope.builtin').keymaps,       'Key Maps' },
        m = { require('telescope.builtin').marks,         'Marks' },
        M = { require('telescope.builtin').man_pages,     'Man Pages' },
        O = { require('telescope.builtin').vim_options,   'Vim Options' },
        r = {
          name = "Replace in Files (Spectre)",
          r = { function() require("spectre").open() end,   'Replace in files (Spectre)' },
          w = { function() require("spectre").open_visual({select_word=true}) end,   'Search Current Word' },
          v = { function() require("spectre").open_visual() end,   'Search Current Word' },
          p = { function() require("spectre").open_file_search({select_word=true}) end,   'Search on current file' },
        },
        R = { require('telescope.builtin').resume,        'Resume previous search' },
        w = { Util.telescope("grep_string"),              'Current Word(root dir)' },
        W = { Util.telescope("grep_string",{cwd = false}),'Current Word(cwd)' },
        s = {         
          Util.telescope("lsp_document_symbols", {
            symbols = {
              "Class",
              "Function",
              "Method",
              "Constructor",
              "Interface",
              "Module",
              "Struct",
              "Trait",
              "Field",
              "Property",
            },
        }), 'Goto Symbol' },
        ["?"] = { require('telescope.builtin').oldfiles,  'Oldfiles' },
        ["/"] = {
          function()
            require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {winblend = 10, previewer = false})
          end, 'Fuzzily search in current buffer' 
        },
      },

      u = {
        name = "UI",
        c = { Util.telescope("colorscheme", { enable_preview = true }), "Colorscheme" },
      },

      x = {
        name = "Diagnostics/QuickFix"
      }
    }

    wk.setup(opts)
    wk.register(mappings, opts)
end

return M


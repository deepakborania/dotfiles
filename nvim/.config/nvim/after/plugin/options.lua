local api = vim.api
local g = vim.g
local opt = vim.opt

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
-- opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true -- Set highlight in search
opt.ignorecase = true -- Case insensitive searching unless /C or capital in search
opt.smartcase = true
opt.signcolumn = "yes" -- Always show the sign column
opt.updatetime = 300 -- Decrease update time
opt.mouse = "a" -- Enable mouse mode
opt.wrap = false
opt.undofile = true
opt.undodir = vim.fn.stdpath('config') .. '/undo'
-- Time in milliseconds to wait for a mapped sequence to complete. So we can show which key faster.
opt.timeoutlen = 300
opt.showmode = false -- Do not need to show the mode. We use the statusline instead.
opt.splitbelow = true
opt.splitright = true
opt.modeline = false

opt.swapfile = false

-- Better Netrw
g.netrw_browse_split = 4 -- Open in previous window
g.netrw_altv = 1 -- Open with right splitting
g.netrw_liststyle = 3 -- Tree-style view

g.mapleader = " "
g.maplocalleader = " "
    
vim.cmd [[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=50}
    augroup END
]]

local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to <Space>
-- api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = " "
g.maplocalleader = " "

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
-- opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true -- Set highlight in search
opt.ignorecase = true -- Case insensitive searching unless /C or capital in search
opt.smartcase = true
opt.signcolumn = "yes" -- Always show the sign column
opt.updatetime = 500 -- Decrease update time
opt.mouse = "a" -- Enable mouse mode
opt.wrap = false
opt.undofile = true
opt.undodir = vim.fn.stdpath('config') .. '/undo'
-- Time in milliseconds to wait for a mapped sequence to complete. So we can show which key faster.
opt.timeoutlen = 300
opt.showmode = false -- Do not need to show the mode. We use the statusline instead.

-- Better Netrw
g.netrw_browse_split = 4 -- Open in previous window
g.netrw_altv = 1 -- Open with right splitting
g.netrw_liststyle = 3 -- Tree-style view

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Better search
opt.path:remove "/usr/include"
opt.path:append "**"
-- vim.cmd [[set path=.,,,$PWD/**]] -- Set the path directly

opt.wildignorecase = true
-- opt.wildignore:append "**/node_modules/*"
-- opt.wildignore:append "**/.git/*"
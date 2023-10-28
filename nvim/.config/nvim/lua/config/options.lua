-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local opt = vim.opt

-- Fix copilot tab problems
vim.g.copilot_assume_mapped = true
-- opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.clipboard = "" -- Don't Sync with system clipboard
opt.tabstop = 4
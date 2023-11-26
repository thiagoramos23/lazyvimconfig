-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local g = vim.g
g.mapleader = ","

-- Vim Test
g["rspec_runner"] = "os_x_iterm2"
g["test#strategy"] = "vimux"
g["VimuxHeight"] = "30"

vim.opt.foldlevel = 3
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Tmux Navigator
local g = vim.g
local opts = { noremap = true, silent = true }

-- windows
vim.keymap.set("n", "<leader>ww", "<C-W>p", { desc = "Other window", remap = true })
vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Delete window", remap = true })
vim.keymap.set("n", "ss", "<C-W>s", { desc = "Split window below", remap = true })
vim.keymap.set("n", "vv", "<C-W>v", { desc = "Split window right", remap = true })

-- Text Misc
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("v", "L", "$")
vim.keymap.set("v", "H", "^")
vim.keymap.set("n", "U", "<C-r>")

-- Git keymaps --
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<cr>")

-- Vim Test

vim.keymap.set("n", "<leader>rn", function()
  g["test#elixir#exunit#executable"] = "mix test"
  vim.cmd([[exec ":TestNearest"]])
end)
vim.keymap.set("n", "<leader>rf", function()
  g["test#elixir#exunit#executable"] = "mix test"
  vim.cmd([[exec ":TestFile"]])
end)
vim.keymap.set("n", "<leader>rs", function()
  g["test#elixir#exunit#executable"] = "mix test"
  vim.cmd([[exec ":TestSuite"]])
end)
vim.keymap.set("n", "<leader>rl", function()
  g["test#elixir#exunit#executable"] = "mix test"
  vim.cmd([[exec ":TestLast"]])
end)
vim.keymap.set("n", "<leader>rv", function()
  g["test#elixir#exunit#executable"] = "mix test"
  vim.cmd([[exec ":TestVisit"]])
end)
vim.keymap.set("n", "<leader>rd", function()
  g["test#elixir#exunit#executable"] = "iex --dbg pry -S mix test"
  vim.cmd([[exec ":TestNearest" .. "--trace"]])
end)

-- FZF

vim.keymap.set("n", "<C-p>", "<cmd>lua require('fzf-lua').files()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>.", "<cmd>lua require('fzf-lua').buffers()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-q>", "<cmd>lua require('fzf-lua').quickfix()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", "<cmd>lua require('fzf-lua').live_grep()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-g>", "<cmd>lua require('fzf-lua').git_commits()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>g", "<cmd>lua require('fzf-lua').grep_cword()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').grep_cWORD()<CR>", { noremap = true, silent = true })

-- TMUX
vim.keymap.set("n", "<C-h>", vim.cmd.TmuxNavigateLeft, opts)
vim.keymap.set("n", "<C-j>", vim.cmd.TmuxNavigateDown, opts)
vim.keymap.set("n", "<C-k>", vim.cmd.TmuxNavigateUp, opts)
vim.keymap.set("n", "<C-l>", vim.cmd.TmuxNavigateRight, opts)

-- Misc
vim.keymap.set("n", "<leader>qq", vim.cmd.nohlsearch, opts)

-- Navigate Buffers
vim.keymap.set("n", "<leader>v", ":bnext<CR>", opts)
vim.keymap.set("n", "<leader>z", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>d", ":BufDel<CR>", opts)
vim.keymap.set("n", "<C-s>", "<Cmd>BufferPick<CR>", opts)
vim.keymap.set("n", "<leader>bo", function()
  vim.cmd([[exec ":%bd\|e#\|bd#"]])
end)

-- Jump To Test
local jump = require("jump-to-test-plugin")
vim.keymap.set("n", "<leader>jt", function()
  jump.openTest()
end)

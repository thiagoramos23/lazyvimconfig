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
vim.keymap.set("n", "-", "<C-W>-", { desc = "Decrease Height", remap = true })
vim.keymap.set("n", "+", "<C-W>+", { desc = "Increase Height", remap = true })
vim.keymap.set("n", "<", "<C-W>>", { desc = "Increase Pane Right", remap = true })
vim.keymap.set("n", ">", "<C-W><", { desc = "Increase Pane Left", remap = true })
vim.keymap.set("n", "<leader>=", "<C-W>=", { desc = "Make all panes equal", remap = true })
vim.keymap.set("n", "<leader>e", ":Oil<CR>")
vim.keymap.set("n", "<leader>ct", ":CopilotChat<CR>", { desc = "Open Copilot Chat", remap = true })
vim.keymap.set(
  "n",
  "<leader>ce",
  ":CopilotChatExplain<CR>",
  { desc = "Open Copilot Chat to Explain Something", remap = true }
)

-- Toggleterm
vim.keymap.set("n", "<C-d>", ":ToggleTerm<CR>", { desc = "Toggle ToggleTerm", remap = true })
-- Text Misc
vim.keymap.set("n", "L", "$")
vim.keymap.set("n", "H", "^")
vim.keymap.set("v", "L", "$")
vim.keymap.set("v", "H", "^")
-- vim.keymap.set("n", "U", "<C-r>")
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
function TestCurrentFile()
  local current_file = vim.fn.expand("%:p")
  local cmd = 'IexTests.test("' .. current_file .. '")'
  vim.cmd("TermExec cmd=" .. cmd .. "")
end
function TestCurrentLine()
  local current_file = vim.fn.expand("%:p")
  local current_line = vim.fn.line(".")
  local cmd = 'IexTests.test("' .. current_file .. ":" .. current_line .. '")'
  vim.cmd("TermExec cmd='" .. cmd .. "'")
end
function WatchCurrentFile()
  local current_file = vim.fn.expand("%:p")
  local cmd = 'IexTests.test_watch("' .. current_file .. '")'
  vim.cmd("TermExec cmd=" .. cmd .. "")
end
function MakeTest()
  vim.cmd("TermExec cmd='iex --dbg pry -S mix'")
end
vim.keymap.set("n", "<leader>tf", ":lua TestCurrentFile()<CR>", { desc = "Test current file" })
vim.keymap.set("n", "<leader>tl", ":lua TestCurrentLine()<CR>", { desc = "Test current line" })
vim.keymap.set("n", "<leader>tw", ":lua WatchCurrentFile()<CR>", { desc = "Watch current file" })
vim.keymap.set("n", "<leader>mt", ":lua MakeTest()<CR>", { desc = "Start Test Env" })
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
-- local harpoon = require("harpoon")
-- harpoon:setup()
-- vim.keymap.set("n", "<leader>a", function()
--   harpoon:list():add()
-- end)
-- vim.keymap.set("n", "<C-e>", function()
--   harpoon.ui:toggle_quick_menu(harpoon:list())
-- end)
-- vim.keymap.set("n", "<M-a>", function()
--   harpoon:list():select(1)
-- end)
-- vim.keymap.set("n", "<M-s>", function()
--   harpoon:list():select(2)
-- end)
-- vim.keymap.set("n", "<M-d>", function()
--   harpoon:list():select(3)
-- end)
-- vim.keymap.set("n", "<M-f>", function()
--   harpoon:list():select(4)
-- end)
-- -- Toggle previous & next buffers stored within Harpoon list
-- vim.keymap.set("n", "<M-j>", function()
--   harpoon:list():prev()
-- end)
-- vim.keymap.set("n", "<M-k>", function()
--   harpoon:list():next()
-- end)
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
  vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
end
-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

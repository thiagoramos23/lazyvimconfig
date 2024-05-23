-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Define a function to format the current buffer with mix format
-- local function format_with_mix()
--   -- Get the full path of the current file
--   local file_path = vim.fn.expand("%:p")
--   if file_path == "" then
--     print("Buffer has no file path.")
--     return
--   end
--
--   local cmd = "mix format " .. file_path
--
--   -- Run the command asynchronously
--   vim.fn.jobstart(cmd, {
--     on_exit = function(j, return_val)
--       -- This function is called when the job exits
--       if return_val == 0 then
--         print("Formatted with mix format")
--         -- Optionally, reload the buffer to reflect any changes
--         vim.cmd("e")
--       else
--         print("mix format failed")
--       end
--     end,
--   })
-- end

_G.sort_highlighted_lines = function()
  -- Get current buffer
  local buf = vim.api.nvim_get_current_buf()

  -- Get positions for the start and end of the highlight
  local start_pos = vim.api.nvim_buf_get_mark(buf, "<")
  local end_pos = vim.api.nvim_buf_get_mark(buf, ">")

  -- Extract the lines that are highlighted
  local lines = vim.api.nvim_buf_get_lines(buf, start_pos[1] - 1, end_pos[1], false)

  -- Sort the lines
  table.sort(lines)

  -- Replace the original lines with the sorted ones
  vim.api.nvim_buf_set_lines(buf, start_pos[1] - 1, end_pos[1], false, lines)
end

-- Create a command that calls your Lua function
vim.api.nvim_set_keymap(
  "v",
  "<Leader>as",
  "<Esc>:lua _G.sort_highlighted_lines()<CR>",
  { noremap = true, silent = true }
)

-- Create an autocommand that formats Elixir files before saving
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   pattern = { "*.ex", "*.exs" },
--   callback = format_with_mix,
-- })

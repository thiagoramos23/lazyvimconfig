-- return {
--   "nvim-telescope/telescope.nvim",
--   keys = {
--     { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
--   },
-- }
return {
  {
    "telescope.nvim",
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
    keys = {
      { "<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
    },
  },
}

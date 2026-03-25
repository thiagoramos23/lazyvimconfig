return {
  {
    "ThePrimeagen/git-worktree.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("git-worktree").setup()
      require("telescope").load_extension("git_worktree")
    end,
    keys = {
      {
        "<leader>gwl",
        function()
          require("telescope").extensions.git_worktree.git_worktrees()
        end,
        desc = "List git worktrees",
      },
      {
        "<leader>gwc",
        function()
          require("telescope").extensions.git_worktree.create_git_worktree()
        end,
        desc = "Create git worktree",
      },
      {
        "<leader>gwd",
        function()
          vim.ui.input({ prompt = "Worktree path to delete: " }, function(input)
            if input and input ~= "" then
              require("git-worktree").delete_worktree(input)
            end
          end)
        end,
        desc = "Delete git worktree",
      },
    },
  },
}

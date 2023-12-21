return {
  "harrisoncramer/gitlab.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim", -- Recommended but not required. Better UI for pickers.
    "nvim-tree/nvim-web-devicons", -- Recommended but not required. Icons in discussion tree.
  },

  enabled = true,
  build = function()
    require("gitlab.server").build(true)
  end, -- Builds the Go binary
  config = function()
    require("gitlab").setup()
  end,
  keys = {
    {
      "<leader>glr",
      function()
        local gitlab = require("gitlab")
        local gitlab_server = require("gitlab.server")
        gitlab.review()
      end,
    },
    {
      "<leader>glp",
      function()
        local gitlab = require("gitlab")
        local gitlab_server = require("gitlab.server")
        gitlab.pipeline()
      end,
    },
    {
      "<leader>glO",
      function()
        local gitlab = require("gitlab")
        local gitlab_server = require("gitlab.server")
        gitlab.create_mr()
      end,
    },
    {
      "<leader>glo",
      function()
        local gitlab = require("gitlab")
        local gitlab_server = require("gitlab.server")
        gitlab.open_in_browser()
      end,
    },
    {
      "<leader>glc",
      function()
        local gitlab = require("gitlab")
        local gitlab_server = require("gitlab.server")
        gitlab.create_comment()
      end,
    },
    {
      "<leader>gln",
      function()
        local gitlab = require("gitlab")
        local gitlab_server = require("gitlab.server")
        gitlab.create_note()
      end,
    },
    {
      "<leader>glC",
      function()
        local gitlab = require("gitlab")
        local gitlab_server = require("gitlab.server")
        gitlab.create_comment_suggestion()
      end,
    },
    {
      "<leader>gld",
      function()
        local gitlab = require("gitlab")
        local gitlab_server = require("gitlab.server")
        gitlab.toggle_discussion()
      end,
    },
    {
      "<leader>glA",
      function()
        local gitlab = require("gitlab")
        local gitlab_server = require("gitlab.server")
        gitlab.approve()
      end,
    },
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tailwindcss = {
          init_options = {
            userLanguages = {
              elixir = "phoenix-heex",
              heex = "phoenix-heex",
            },
          },
          includeLanguages = {
            ["html-eex"] = "html",
            ["phoenix-heex"] = "html",
            heex = "html",
            eelixir = "html",
            elixir = "html",
          },
          -- filetypes_include = { "eruby", "eelixir", "elixir", "heex", "html", "html-heex" },
        },
      },
      -- setup = {
      --   tailwindcss = function(_, opts)
      --     local tw = require("lspconfig.server_configurations.tailwindcss")
      --     opts.filetypes = opts.filetypes or {}
      --     opts.init_options = {
      --       userLanguages = {
      --         elixir = "phoenix-heex",
      --         eruby = "erb",
      --         heex = "phoenix-heex",
      --         svelte = "html",
      --         rust = "html",
      --       },
      --     }
      --     -- Add default filetypes
      --     vim.list_extend(opts.filetypes, tw.default_config.filetypes)
      --
      --     -- Remove excluded filetypes
      --     --- @param ft string
      --     opts.filetypes = vim.tbl_filter(function(ft)
      --       return not vim.tbl_contains(opts.filetypes_exclude or {}, ft)
      --     end, opts.filetypes)
      --
      --     -- Add additional filetypes
      --     vim.list_extend(opts.filetypes, opts.filetypes_include or {})
      --   end,
      -- },
    },
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
    },
    opts = function(_, opts)
      -- original Lazyvim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },
}

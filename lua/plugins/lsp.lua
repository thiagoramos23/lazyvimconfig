return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lexical = {
          filetypes = { "elixir", "eelixir" },
          cmd = {
            "/Users/quaseninja/projects/open_source/lexical/_build/dev/package/lexical/bin/start_lexical.sh",
          },
        },
      },
    },
  },
}

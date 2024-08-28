return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lexical = {
          filetypes = { "elixir", "eelixir" },
          cmd = { "/Users/thiago/personal/open_source/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
        },
      },
    },
  },
}

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lexical = {
          filetypes = { "elixir", "eelixir" },
        },
      },
    },
  },
}

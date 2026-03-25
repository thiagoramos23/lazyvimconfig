return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        expert = {
          filetypes = { "elixir", "eelixir", "heex" },
          cmd = {
            "/Users/thiago/work/expert/apps/expert/burrito_out/expert_darwin_arm64",
            "--stdio",
          },
        },
      },
    },
  },
}

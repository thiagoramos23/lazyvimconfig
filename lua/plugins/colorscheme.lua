return {
  -- add gruvbox
  { "morhetz/gruvbox" },

  { "shaunsingh/solarized.nvim" },
  { "Mofiqul/dracula.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}

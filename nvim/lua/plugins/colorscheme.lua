-- lua/plugins/colorscheme.lua
return {
  -- Install catppuccin
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },

  -- Tell LazyVim which theme to use
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
}

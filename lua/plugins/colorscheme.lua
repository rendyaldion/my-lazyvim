return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = function()
      return {
        transparent_background = true,
      }
    end,
  },

  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}

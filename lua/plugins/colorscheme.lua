return {
  {
    "github-main-user/lytmode.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("lytmode")
    end,
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("kanagawa-dragon")
    -- end,
  },
  {
    "xero/miasma.nvim",
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.cmd("colorscheme miasma")
    -- end,
  },
}

return {
  "nvim-tree/nvim-tree.lua",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup({
      git = {
        ignore = false,
      },
      filters = {
        dotfiles = false,
      },
      view = {
        side = "right",
      },
      renderer = {
        group_empty = true,
        indent_markers = { enable = true },
        icons = {
          padding = " ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
          },
          glyphs = {
            default = "",
            folder = {
              default = "",
              open = "",
              arrow_closed = "",
              arrow_open = "",
            },
          },
        },
      },
    })

    vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

    vim.api.nvim_create_autocmd("BufWinEnter", {
      pattern = "NvimTree_*",
      callback = function()
        vim.cmd("wincmd L")
      end,
    })
  end,
}

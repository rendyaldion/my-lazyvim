-- ~/.config/nvim/lua/plugins/toggleterm.lua
return {
  "akinsho/toggleterm.nvim",
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-;>]], -- Set keybinding here
      direction = "horizontal", -- Opens terminal at the bottom
      size = 15, -- Set the terminal height
    })
    vim.keymap.set("n", "<C-;>", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle Floating Terminal" })
  end,
}

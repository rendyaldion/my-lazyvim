-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

-- nvim-tree keymaps
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

vim.keymap.set("v", "<leader>j", ":m '>+1<CR>gv=gv", { desc = "Move down", silent = true })
vim.keymap.set("v", "<leader>k", ":m '<-2<CR>gv=gv", { desc = "Move up", silent = true })

vim.keymap.set("n", "<leader>dl", function()
  vim.diagnostic.setloclist()
  vim.cmd("lopen")
end, { desc = "List diagnostics (location list)" })

vim.api.nvim_set_keymap("i", "<C-l>", "<Esc>la", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<Esc>ha", { noremap = true, silent = true })

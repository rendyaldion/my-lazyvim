-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options hereby

vim.keymap.set("n", "j", "gj", { noremap = true })
vim.keymap.set("n", "k", "gk", { noremap = true })

vim.api.nvim_set_keymap("i", "<C-l>", "<Esc>la", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<C-h>", "<Esc>ha", { noremap = true, silent = true })

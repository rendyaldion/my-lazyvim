return {
  {
    "terryma/vim-multiple-cursors",
    config = function()
      -- Add your custom key mappings or other settings here
      -- For example, to make `Ctrl + N` work as the shortcut for multiple cursors:
      vim.g.VM_default_mappings = 0 -- disable default mappings (optional)
      vim.api.nvim_set_keymap("n", "<C-n>", ":MultipleCursorsFind<CR>", { noremap = true, silent = true })
      vim.api.nvim_set_keymap("x", "<C-n>", ":MultipleCursorsFind<CR>", { noremap = true, silent = true })
    end,
  },
}

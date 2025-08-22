-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options hereby

-- java only
vim.api.nvim_create_autocmd("FileType", {
  pattern = "java",
  callback = function(ev)
    vim.b.autoformat = false
  end,
})

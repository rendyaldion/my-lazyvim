return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    opts.servers = opts.servers or {}
    opts.servers.jdtls = nil
    opts.setup = opts.setup or {}
    opts.setup.jdtls = function() return true end
  end,
}

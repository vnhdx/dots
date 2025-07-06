return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
      -- Be aware that you also will need to properly configure your LSP server to
      -- provide the inlay hints.
      opts.inlay_hints = { enable = false }
      return opts
    end,
  },
}

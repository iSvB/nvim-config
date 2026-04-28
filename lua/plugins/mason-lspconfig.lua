return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  config = function()
    local lsp = require("config.lsp")

    require("mason-lspconfig").setup({
      automatic_enable = true,
      ensure_installed = lsp.servers,
    })
  end
}

return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    "mason-org/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  opts = function()
    local lsp = require("config.lsp")

    return {
      automatic_enable = true,
      ensure_installed = lsp.mason_servers,
    }
  end,
}

return {
  "neovim/nvim-lspconfig",
  config = function()
    local lsp = require("config.lsp")

    vim.lsp.enable(lsp.servers)
  end,
}

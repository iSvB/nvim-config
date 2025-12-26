return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('clangd')

    vim.lsp.config('*', {
      vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, {}),
      vim.keymap.set('n', '<leader>ic', vim.lsp.buf.incoming_calls, {}),
      vim.keymap.set('n', '<leader>oc', vim.lsp.buf.outgoing_calls, {}),
      vim.keymap.set('n', '<leader>re', vim.lsp.buf.references, {}),
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {}),
      vim.keymap.set('n', '<leader>de', vim.lsp.buf.declaration, {}),
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}),
      vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, {}),
      vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, {}),
    })
  end
}

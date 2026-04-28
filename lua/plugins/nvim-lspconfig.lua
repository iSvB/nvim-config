return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('clangd')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('gopls')

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ic', vim.lsp.buf.incoming_calls, opts)
        vim.keymap.set('n', '<leader>oc', vim.lsp.buf.outgoing_calls, opts)
        vim.keymap.set('n', '<leader>re', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>de', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, opts)
      end,
    })
  end
}

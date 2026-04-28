return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('clangd')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('gopls')

    vim.lsp.config('*', {
      -- Save
      vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" }),

      vim.keymap.set('n', '<leader>rr', vim.lsp.buf.rename, {}),
      vim.keymap.set('n', '<leader>ic', vim.lsp.buf.incoming_calls, {}),
      vim.keymap.set('n', '<leader>oc', vim.lsp.buf.outgoing_calls, {}),
      vim.keymap.set('n', '<leader>re', vim.lsp.buf.references, {}),
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {}),
      vim.keymap.set('n', '<leader>de', vim.lsp.buf.declaration, {}),
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {}),
      vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, {}),
      vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, {}),

      vim.keymap.set("n", "<leader>nh", function() Snacks.notifier.show_history() end, { desc = "Show notification history" }),

      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" }),
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" }),
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic" }),
      vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics list" })
    })
  end
}

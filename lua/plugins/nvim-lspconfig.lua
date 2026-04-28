return {
  "neovim/nvim-lspconfig",
  config = function()
    vim.lsp.enable('lua_ls')
    vim.lsp.enable('clangd')
    vim.lsp.enable('ts_ls')
    vim.lsp.enable('gopls')

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(event)
        local function map(lhs, rhs, desc)
          vim.keymap.set('n', lhs, rhs, { buffer = event.buf, desc = desc })
        end

        map('<leader>rr', vim.lsp.buf.rename, 'Rename symbol')
        map('<leader>ic', vim.lsp.buf.incoming_calls, 'Incoming calls')
        map('<leader>oc', vim.lsp.buf.outgoing_calls, 'Outgoing calls')
        map('<leader>re', vim.lsp.buf.references, 'References')
        map('<leader>ca', vim.lsp.buf.code_action, 'Code action')
        map('<leader>de', vim.lsp.buf.declaration, 'Go to declaration')
        map('gd', vim.lsp.buf.definition, 'Go to definition')
        map('<leader>td', vim.lsp.buf.type_definition, 'Go to type definition')
        map('<leader>fm', vim.lsp.buf.format, 'Format buffer')
      end,
    })
  end
}

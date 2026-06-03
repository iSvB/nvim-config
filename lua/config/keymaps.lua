vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

vim.keymap.set("n", "<leader>nh", function()
  require("snacks").notifier.show_history()
end, { desc = "Show notification history" })

-- Diagnostics

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })

vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics list" })

-- LSP

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
    end

    map("<leader>rr", vim.lsp.buf.rename, "Rename symbol")
    map("<leader>ic", vim.lsp.buf.incoming_calls, "Incoming calls")
    map("<leader>oc", vim.lsp.buf.outgoing_calls, "Outgoing calls")
    map("<leader>re", vim.lsp.buf.references, "References")
    map("<leader>ca", vim.lsp.buf.code_action, "Code action")
    map("<leader>de", vim.lsp.buf.declaration, "Go to declaration")
    map("gd", vim.lsp.buf.definition, "Go to definition")
    map("<leader>td", vim.lsp.buf.type_definition, "Go to type definition")
    map("<leader>fm", vim.lsp.buf.format, "Format buffer")
  end,
})

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

-- Trouble

vim.keymap.set("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set(
  "n",
  "<leader>xX",
  "<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
  { desc = "Buffer diagnostics (Trouble)" }
)
vim.keymap.set("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<CR>", { desc = "Symbols (Trouble)" })
vim.keymap.set(
  "n",
  "<leader>cl",
  "<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
  { desc = "LSP definitions / references / ... (Trouble)" }
)
vim.keymap.set("n", "<leader>xL", "<cmd>Trouble loclist toggle<CR>", { desc = "Location list (Trouble)" })
vim.keymap.set("n", "<leader>xQ", "<cmd>Trouble qflist toggle<CR>", { desc = "Quickfix list (Trouble)" })

-- LSP

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if not client then
      return
    end

    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { buffer = event.buf, desc = desc })
    end

    local function lsp_map(method, lhs, rhs, desc)
      if client:supports_method(method, event.buf) then
        map(lhs, rhs, desc)
      end
    end

    lsp_map("textDocument/rename", "<leader>rr", vim.lsp.buf.rename, "Rename symbol")
    lsp_map("callHierarchy/incomingCalls", "<leader>ic", vim.lsp.buf.incoming_calls, "Incoming calls")
    lsp_map("callHierarchy/outgoingCalls", "<leader>oc", vim.lsp.buf.outgoing_calls, "Outgoing calls")
    lsp_map("textDocument/references", "<leader>re", vim.lsp.buf.references, "References")
    lsp_map("textDocument/codeAction", "<leader>ca", vim.lsp.buf.code_action, "Code action")
    lsp_map("textDocument/declaration", "<leader>de", vim.lsp.buf.declaration, "Go to declaration")
    lsp_map("textDocument/definition", "<leader>gd", vim.lsp.buf.definition, "Go to definition")
    lsp_map("textDocument/typeDefinition", "<leader>td", vim.lsp.buf.type_definition, "Go to type definition")
    lsp_map("textDocument/implementation", "<leader>im", vim.lsp.buf.implementation, "Go to implementation")
    lsp_map("textDocument/formatting", "<leader>fm", vim.lsp.buf.format, "Format buffer")
  end,
})

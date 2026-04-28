vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })

vim.keymap.set("n", "<leader>nh", function()
  Snacks.notifier.show_history()
end, { desc = "Show notification history" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Diagnostics list" })

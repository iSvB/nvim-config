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

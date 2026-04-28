return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<C-p>',
      function()
        builtin.find_files({ no_ignore = true, hidden = true })
      end,
      { desc = "Find files including gitignored and hidden" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
  end
}

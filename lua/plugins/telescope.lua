return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
      },
    })

    telescope.load_extension("ui-select")

    local function map(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, { desc = desc })
    end

    map('<leader>ff', builtin.find_files, 'Find files')
    map('<C-p>', function()
      builtin.find_files({ no_ignore = true, hidden = true })
    end, 'Find all files')
    map('<leader>fg', builtin.live_grep, 'Live grep')
    map('<leader>fb', builtin.buffers, 'Find buffers')
  end
}

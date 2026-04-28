return {
  "s1n7ax/nvim-window-picker",
  name = "window-picker",
  event = "VeryLazy",
  version = "2.*",
  opts = {
    hint = "floating-big-letter",
    filter_rules = {
      autoselect_one = true,
      include_current_win = false,
      bo = {
        filetype = { "neo-tree", "notify", "snacks_notif" },
        buftype = { "terminal" },
      },
    },
  },
  config = function(_, opts)
    local picker = require("window-picker")

    picker.setup(opts)

    vim.keymap.set("n", "<leader>wp", function()
      local win = picker.pick_window()

      if win then
        vim.api.nvim_set_current_win(win)
      end
    end, { desc = "Pick window" })
  end,
}

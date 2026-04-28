return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    { "3rd/image.nvim", opts = {} },
  },
  lazy = false, -- neo-tree will lazily load itself
  ---@module "neo-tree"
  ---@type neotree.Config?
  opts = {},
  config = function(_, opts)
    local function map(lhs, rhs, desc)
      vim.keymap.set("n", lhs, rhs, { desc = desc })
    end

    map("<C-n>", "<cmd>Neotree filesystem reveal left<CR>", "Reveal file tree")
    map("<C-b>", "<cmd>Neotree buffers reveal float<CR>", "Show buffers tree")

    require("neo-tree").setup(opts)
  end,
}

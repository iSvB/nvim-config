return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup()

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "lua",
        "javascript",
        "c",
        "go",
        "gomod",
        "gowork",
        "gosum",
        "cs",
        "markdown",
      },
      callback = function()
        vim.treesitter.start()
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}

return {
  -- autoclose and autorename code tags (html, js, markdown, etc.)
  "windwp/nvim-ts-autotag",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      autotag = {
        enable = true,
          }
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  }
}

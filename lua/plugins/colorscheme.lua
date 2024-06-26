return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd("colorscheme catppuccin-mocha")
    require("catppuccin").setup({
      colorscheme = "mocha",
      integrations = {
        treesitter = true
      }
    })
  end
}

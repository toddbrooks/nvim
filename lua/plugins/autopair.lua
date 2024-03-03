return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  lazy = false,
  config = function()
    require("nvim-autopairs").setup({
  -- opts go here
    })
  end
}

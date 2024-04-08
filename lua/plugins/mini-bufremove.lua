return {
  "echasnovski/mini.bufremove",
  version = "*",
  --
  config = function()
    require("mini.bufremove").setup()
  end,
  keys = {
    { "<leader>q", "<cmd>bdelete<CR>", desc = "Close buffer" }
  }
}

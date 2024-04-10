return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    require("ibl").setup({
      indent = {
        char = "┊",
      },
    })
  end,
  opts = {
    indent = {
      char = "┊",
    },
  },
}

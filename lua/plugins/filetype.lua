return {
  "nathom/filetype.nvim",
  event = "BufEnter",
  config = function()
    require("filetype").setup({
      overrides = {
        extenstions = {
          ["*.cfn"] = "yaml",
          tf = "terraform",
          tfvars = "terraform",
          tfstate = "json",
        },
      }
    })
  end,
}

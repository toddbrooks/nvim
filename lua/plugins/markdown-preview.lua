local mapkey = require("util.keymapper").mapkey

return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MardownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  config = function()
    mapkey("<leader>mp", "MarkdownPreviewToggle", "n")
  end,
}

return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = { "windwp/nvim-ts-autotag" },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      sync_install = true,
      highlight = {
        enable = true,
      },
      -- modules = {
      -- },
      ensure_installed = {
        "bash",
        "c",
        "css",
        "dockerfile",
        "gitignore",
        "graphql",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "rust",
        "svelte",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      -- ignore_install = {},
      -- auto_install = false,
    })
  end,
}

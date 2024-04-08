return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate", dependencies = { "windwp/nvim-ts-autotag",
  },
  config = function()
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      higlight = {
        enable = true,
      },
      indent = { enable = true },
      autotag = {
        enabled = true,
      },
      ensure_installed = {
        "bash",
        "c",
        "css",
        "dockerfile",
        "gitignore",
        "graphql",
        "html",
        "javascript",
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
      -- Uncommenting the below causes
      -- the error "E13: File exists (add ! to override)"
      -- when opening a file with Telescope find_files
      --
      --incremental_selection = {
      --  enable = true,
      --  keymaps = {
      --    init_selection = "<C-space>",
      --    node_selection = "<C-space>",
      --    scope_incremental = false,
      --    node_decremental = "<bs>",
      --  },
      --},
    })
  end,
}

return {
  "folke/trouble.nvim",
  event = "BufWinEnter",
  version = "*",
  desc = "A pretty list for showing diagnostics, references, telescope results and quickfix list and location list",
  dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
  keys = {
    { "<leader>xx", "<cmd>TroubleToggle<CR>", desc = "" },
    { "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics Trouble toggle" },
    { "<leader>xd", "<cmd>TroubleToggle document_diagnostics<CR>", desc = "Document Diagnostics Trouble toggle" },
    { "<leader>xq", "<cmd>TroubleToggle quickfix<CR>", desc = "Quickfix Trouble toggle" },
    { "<leader>xl", "<cmd>TroubleToggle loclist<CR>", desc = "Location Trouble toggle" },
    { "<leader>xr", "<cmd>TroubleToggle lsp_references<CR>", desc = "LSP References Trouble toggle" },
    { "<leader>xf", "<cmd>TroubleToggle lsp_definitions<CR>", desc = "LSP Definitions Trouble toggle" },
    { "<leader>xy", "<cmd>TroubleToggle lsp_type_definitions<CR>", desc = "LSP Type Definitions Trouble toggle" },
    { "<leader>xt", "<cmd>TodoTrouble<CR>", desc = "Open todos in trouble" },
  },
  --
  config = function()
    --local actions = require("telescope.actions")
    -- local trouble = require("trouble.providers.telescope")
    local open_with_trouble = require("trouble.sources.telescope").open

    -- Use this to add more results without clearing the trouble list
    -- local add_to_trouble = require("trouble.sources.telescope").add()

    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = { ["<c-t>"] = open_with_trouble },
          n = { ["<c-t>"] = open_with_trouble },
        },
      },
    })
  end,
}

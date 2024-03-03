local mapkey = require("util.keymapper").mapkey

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
            ["<C-h>"] = "which_key",
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = true,
          hidden = true,
        },
        live_grep = {
          theme = "dropdown",
          previewer = true,
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
        },
      },
    })
  end,
  keys = {
		mapkey("<leader>fk", "Telescope keymaps", "n"),
		mapkey("<leader>fh", "Telescope help_tags", "n"),
		mapkey("<leader>ff", "Telescope find_files", "n"),
		mapkey("<leader>fg", "Telescope live_grep", "n"),
		mapkey("<leader>fb", "Telescope buffers", "n"),
  },
}


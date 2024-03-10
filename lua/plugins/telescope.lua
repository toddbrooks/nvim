local mapkey = require("util.keymapper").mapkey

return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-k>"] = actions.move_selection_previous, -- move to previous result
						["<C-h>"] = actions.which_key,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
				layout_config = {
					vertical = { width = 0.5 },
				},
			},
			pickers = {
				find_files = {
					theme = "dropdown",
					previewer = true,
					hidden = false,
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

		telescope.load_extension("fzf")
	end,
	keys = {
		mapkey("<leader>fk", "Telescope keymaps", "n"),
		mapkey("<leader>fh", "Telescope help_tags", "n"),
		mapkey("<leader>ff", "Telescope find_files", "n"),
		mapkey("<leader>fg", "Telescope live_grep", "n"),
		mapkey("<leader>fb", "Telescope buffers", "n"),
		mapkey("<leader>fc", "Telescope grep_string", "n"),

		mapkey("<C-j>", "Telescope move_selection_next", "n"),
		mapkey("<C-k>", "Telescope move_selection_previous", "n"),
		mapkey("<C-h>", "Telescope which_key", "n"),
		mapkey("<C-q>", "Telescope send_selected_to_qflist", "n"),
	},
}

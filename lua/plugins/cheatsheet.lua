return {
	"sudormrfbin/cheatsheet.nvim",
	lazy = true,
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
	--
	config = function()
		require("cheatsheet").setup({
			-- custom opts go here
			bundled_cheatsheets = {
				disabled = {
					"nerd-fonts",
					"unicode",
					"markdown",
				},
			},
			telescope_mappings = {
				["<CR>"] = require("cheatsheet.telescope.actions").select_or_execute,
				["<A-CR>"] = require("cheatsheet.telescope.actions").select_or_fill_commandline,
			},
		})
	end,
}

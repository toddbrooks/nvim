return {
	"sudormrfbin/cheatsheet.nvim",
  lazy = false,
	config = function()
		require("cheatsheet").setup({
			-- custom opts go here
			telescope_mappings = {
				["<CR>"] = require("cheatsheet.telescope.actions").select_or_execute,
				["<A-CR>"] = require("cheatsheet.telescope.actions").select_or_fill_commandline,
			},
		})
	end,
	dependencies = {
		{ "nvim-telescope/telescope.nvim" },
		{ "nvim-lua/popup.nvim" },
		{ "nvim-lua/plenary.nvim" },
	},
}

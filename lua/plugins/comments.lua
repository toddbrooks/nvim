return {
	"numToStr/Comment.nvim",
	lazy = false,
	config = function()
		require("Comment").setup({
			toggler = {
				line = "gcc",
				block = "gcb",
			},
			opleader = {
				line = "goc",
				block = "gob",
			},
		})
	end,
}

return {
	-- indent guides
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "InsertEnter",
	--
	config = function()
		require("ibl").setup({
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"alpha",
					"dashboard",
					"neo-tree",
					"Trouble",
					"trouble",
					"lazy",
					"mason",
					"notify",
					"toggleterm",
					"lazyterm",
				},
			},
		})
	end,
}

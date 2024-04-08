return {
	-- autoclose and autorename code tags (html, js, markdown, etc.)
	"windwp/nvim-ts-autotag",
	lazy = false,
	event = "InsertEnter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	--
	config = function()
		require("nvim-ts-autotag").setup({
      -- config
		})
	end,
}

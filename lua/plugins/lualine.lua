return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				theme = "catppuccin",
				globalstatus = true, -- only want 1 status line
				icons_enabled = true,
			},
		})
	end,
}

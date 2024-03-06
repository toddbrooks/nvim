return {
	-- file icons for file explorer
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			require("nvim-web-devicons").setup({})
		end,
	},

	-- UI Component Library for Neovim For popups, etc.
	{
		"MunifTanjim/nui.nvim",
		lazy = true,
	},

	{
		"rcarriga/nvim-notify",
		lazy = false,
    config = function()
      require("notify").setup({
        -- config here
      })
    end
	},
}

return {
	-- LSP package manager
	"williamboman/mason.nvim",
	cmd = "Mason",
	event = "BufReadPre",
	--
	config = function()
		require("mason").setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})
	end,
}

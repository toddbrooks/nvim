return {
	"glepnir/lspsaga.nvim",
	lazy = false,
	config = function()
		require("lspsaga").setup({
			ui = {
				code_action = "󰉂",
				actionfix = "󰉂",
			},
			diagnostic = {
				extend_relatedInformation = true,
				extend_gitsigns = true,
				show_source = true,
			},
			symbol_in_winbar = {
				enable = false,
			},
			finder = {
				keys = {
					vsplit = "v",
				},
			},
			lightbulb = {
				sign = true,
				virtual_text = false,
			},
			code_action = {
				extend_gitsigns = true,
				only_in_cursor = false,
			},
			callhierarchy = {
				keys = {
					-- toggle_or_req = "<cr>",
					toggle_or_req = "<cr>",
					edit = "o", -- open file
				},
			},
			outline = {
				win_position = "right",
				close_after_jump = true,
				auto_close = true,
				-- detail = false,
				keys = {
					jump = "e",
					toggle_or_jump = "o",
				},
			},
		})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
}

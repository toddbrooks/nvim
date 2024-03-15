return {
	-- "glepnir/lspsaga.nvim",
	"nvimdev/lspsaga.nvim",
	event = "LspAttach",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	--
	config = function()
		require("lspsaga").setup({
			ui = {
				code_action = "💡",
				actionfix = "󰉂",
				expand = "⊞",
				imp_sign = "󰳛 ",
			},
			beacon = {
				enable = true,
				frequency = 7,
			},
			scroll_preview = {
				scroll_down = "<C-f>",
				scroll_up = "<C-b>",
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
}

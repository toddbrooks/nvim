return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		--
		config = function()
			require("neo-tree").setup({
				default_component_configs = {
					git_status = {
						symbols = {
							-- Change type
							added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
							modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
							deleted = "✖", -- this can only be used in the git_status source
							renamed = "󰁕", -- this can only be used in the git_status source
							-- Status type
							untracked = "",
							ignored = "",
							unstaged = "󰄱",
							staged = "",
							conflict = "",
						},
					},
				},
				close_if_last_window = false,
				enable_git_status = true,
				filesystem = {
					filtered_items = {
						visible = false, -- when true, hidden files look different
						hide_gitignored = true,
						hide_hidden = true,
					},
					follow_current_file = {
						enabled = true, -- This will find and focus the file in the active buffer every time
					},
					hide_root_node = false,
				},
			})
		end,
		keys = {
			{
				"<leader>e",
				function()
					require("neo-tree.command").execute({ toggle = true })
				end,
				desc = "Explorer NeoTree Toggle (root dir)",
			},
			{
				"<s-h>",
				"<c-w>h",
				desc = "Window left",
			},
			{
				"<s-l>",
				"<c-w>l",
				desc = "Window right",
			},
		},
	},
}

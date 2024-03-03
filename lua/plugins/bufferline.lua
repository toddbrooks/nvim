local mapkey = require("util.keymapper").mapkey

return {
	{
		"akinsho/bufferline.nvim",
		lazy = false,
		version = "*",
		dependencies = { "nvim-tree/nvim-web-devicons", "mini.bufremove" },
		config = function()
			require("bufferline").setup({
				options = {
          -- stylua: ignore
          close_command = function(n)
            require("mini.bufremove").delete(n, false)
          end,
          -- stylua: ignore
          separator_style = "slant",
					diagnostics = "nvim_lsp",
					always_show_bufferline = true,
					--- count is an integer representing total count of errors
					--- level is a string "error" | "warning"
					--- diagnostics_dict is a dictionary from error level
					--- ("error", "warning" or "info") to number of errors for each level.
					--- this should return a string
					--- Don't get too fancy as this function will be executed a lot
					diagnostics_indicator = function(count, level, _, _)
						local icon = level:match("error") and " " or " "
						return " " .. icon .. count
					end,
					offsets = {
						{
							filetype = "neo-tree",
							text = "Neo-tree",
							highlight = "Directory",
							text_align = "left",
						},
					},
				},
			})
			-- keybind options
			local opts = { noremap = false, silent = true }
			-- set keybinds
			mapkey("<tab>", "BufferLineCycleNext", "n", opts)
			mapkey("<S-tab>", "BufferLineCyclePrev", "n", opts)
		end,
	},
}

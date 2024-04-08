return {
	"akinsho/bufferline.nvim",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"mini.bufremove",
	},
	--
	config = function()
		require("bufferline").setup({
			options = {
				always_show_bufferline = true,
				separator_style = "none",
				show_tab_indicators = false,
				show_close_icon = false,
				close_icon = "",
          -- stylua: ignore
          -- close_command = function(n)
            -- require("mini.bufremove").delete(n, false)
          -- end,
          -- stylua: ignore
          themable = true,
				indicator = {
					style = "underline",
				},
				diagnostics = "nvim_lsp",
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
						highlight = "StatusLine",
						text_align = "left",
					},
				},
				highlights = {
					separator = {
						fg = { attribute = "bg", highlight = "StatusLine" },
						bg = { attribute = "bg", highlight = "BufferlineInactive" },
					},
					separator_visible = {
						fg = { attribute = "bg", highlight = "StatusLine" },
					},
					-- Tabs
					tab = {
						fg = { attribute = "bg", highlight = "StatusLineComment" },
						bg = { attribute = "bg", highlight = "BufferlineInactive" },
					}, --inactiveBg,
					tab_separator = {
						fg = { attribute = "bg", highlight = "StatusLine" },
						bg = { attribute = "bg", highlight = "BufferlineInactive" },
					},
					tab_separator_selected = {
						fg = { attribute = "bg", highlight = "StatusLine" },
					},
					tab_close = {
						bg = "yellow",
					},
				},
			},
		})
		-- keybind options
		-- local opts = { noremap = false, silent = true }
		-- set keybinds
		-- mapkey("<tab>", "BufferLineCycleNext", "n", opts)
		-- mapkey("<S-tab>", "BufferLineCyclePrev", "n", opts)
		-- mapkey("<leader>fn", "enew", "n", opts)
	end,
  keys = { -- Example mapping to toggle outline
    { "<tab>", "<cmd>BufferLineCycleNext<CR>", desc = "Next buffer tab" },
    { "<S-tab>", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous buffer tab" },
    { "<leader>fn", "<cmd>enew<CR>", desc = "New buffer" },
  },
}

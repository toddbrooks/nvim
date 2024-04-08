return {
  "hedyhli/outline.nvim",
  event = "BufEnter",
  cmd = { "Outline", "OutlineOpen" },
  keys = { -- Example mapping to toggle outline
    { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  opts = {
    -- Your setup opts here
    symbols = {
      icon_fetcher = function(k)
        if k == "String" then
          return ""
        end
        return false
      end,
      icon_source = "lspkind",
    },
  },
	config = function()
		require("outline").setup({
			open_automatic = true,
			show_numbers = true,
			show_counts = true,
			show_fold_buttons = true,
			auto_close_tree = true,
			open_cmd = "30vnew",
			auto_preview = true,
			preview_cmd = "keepjumps keepalt",
			mappings = {
				toggle_fold = { "<CR>", "o" },
				toggle_preview = "<Tab>",
				move_up = "k",
				move_down = "j",
				move_tree_up = "K",
				move_tree_down = "J",
				move_parent = "h",
				move_child = "l",
				focus_tree = "<C-n>",
				close_tree = "<C-w>",
				open_tree = "<C-v>",
				preview = "<C-p>",
				preview_edit = "<C-x>",
				preview_vsplit = "<C-v>",
				preview_split = "<C-s>",
				preview_tab = "<C-t>",
			},
		})
	end,
}

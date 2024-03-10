local mapkey = require("util.keymapper").mapkey

return {
	"voldikss/vim-floaterm",
	lazy = false,
	--
	config = function()
		-- set keybinds
		mapkey("<Esc>", "FloatermHide!", "t", { noremap = true, silent = true })
		mapkey("<leader>t", "FloatermToggle", "n", { noremap = false, silent = true })
	end,
}

local mapkey = require("util.keymapper").mapkey

return {
	"echasnovski/mini.bufremove",
	version = "*",
	config = function()
		require("mini.bufremove").setup()
		-- keybind options
		local opts = { noremap = false, silent = true }
		-- set keybinds
		mapkey("<leader>q", "bdelete", "n", opts)
	end,
}

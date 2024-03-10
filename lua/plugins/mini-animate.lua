return {
	"echasnovski/mini.animate",
	version = "*",
	event = "BufEnter",
	--
	config = function()
		require("mini.animate").setup()
	end,
}

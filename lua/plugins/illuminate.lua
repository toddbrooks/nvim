return {
	-- automatically highlight other uses of word under cursor
	"RRethy/vim-illuminate",
	event = "InsertEnter",
	--
	config = function()
		require("illuminate").configure({
			-- custom configuration options go here
		})
	end,
}

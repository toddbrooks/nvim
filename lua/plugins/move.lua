local mapkey = require("util.keymapper").mapkey

return {
  "fedepujol/move.nvim",
  event = "BufEnter",
	config = function()
		require("move").setup({
			-- config here
			line = {
				enable = true,
				indent = true,
			},
			block = {
				enable = true,
				indent = true,
			},
			word = {
				enable = true,
			},
			char = {
				enable = false,
			},
		})
		-- Keybind action
		local opts = { noremap = true, silent = true }
    -- The below keymaps utilize the Alt (Option) key.
    -- To use this in kitty, you must add the following to the kitty.conf:
    -- macos_option_as_alt left

		-- Normal mode movement
    mapkey("<A-j>", "MoveLine(1)", "n", opts)
		mapkey("<A-k>", "MoveLine(-1)", "n", opts)
		mapkey("<A-h>", "MoveHChar(-1)", "n", opts)
		mapkey("<A-l>", "MoveHChar(1)", "n", opts)
		-- Visual mode movement
		mapkey("<A-j>", "MoveLine(1)", "v", opts)
		mapkey("<A-k>", "MoveLine(-1)", "v", opts)
		mapkey("<A-h>", "MoveHChar(-1)", "v", opts)
		mapkey("<A-l>", "MoveHChar(1)", "v", opts)
	end,
}

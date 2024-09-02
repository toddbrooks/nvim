-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

return {
	"github/copilot.vim",
	lazy = false,
	--
	config = function()
		-- config options here
    -- vim.cmd("Copilot disable")
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true, script = true })
	end,
}

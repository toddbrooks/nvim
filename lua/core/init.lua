
-- Highlight text upon copy/yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("ConfigGroup", { clear = true }),
	pattern = "*",
	command = "lua vim.highlight.on_yank({ higroup = 'Substitute', timeout = 400 })",
})

require("core.globals")
require("core.options")
require("core.keymaps")
--require("core.autocmds")


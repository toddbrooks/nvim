local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Highlight text upon copy/yank
vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("ConfigGroup", { clear = true }),
	pattern = "*",
	command = "lua vim.highlight.on_yank({ higroup = 'Substitute', timeout = 350 })",
})

require("config.globals")
require("config.options")
require("config.keymaps")
require("config.autocmds")

local plugins = "plugins"

local opts = {
	defaults = {
		lazy = true,
	},
	-- install = {
		-- colorscheme = { "catppuccin" },
	-- },
	rtp = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"netrwPlugin",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
	},
	change_detection = {
		notify = true,
	},
}

require("lazy").setup(plugins, opts)

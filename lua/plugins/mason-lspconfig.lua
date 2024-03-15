local opts = {
	ensure_installed = {
		"bashls",
		"dockerls",
		"efm",
		"emmet_ls",
    "hydra_lsp",
		"jsonls",
		"lua_ls",
		"pyright",
		"rust_analyzer",
		"tsserver",
		"tailwindcss",
	},
	automatic_installation = true,
}

return {
	"williamboman/mason-lspconfig.nvim",
	opts = opts,
	lazy = false,
	-- event = "BufReadPre",
	dependencies = "williamboman/mason.nvim",
}

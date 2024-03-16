local opts = {
	ensure_installed = {
		"bashls",
		"cssls",
		"dockerls",
		"efm",
		"emmet_ls",
		"eslint",
		"jsonls",
		"lua_ls",
		"marksman",
		"pyright",
		"rust_analyzer",
		"svelte",
		"tsserver",
		"tailwindcss",
		"tflint",
		"yamlls",
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

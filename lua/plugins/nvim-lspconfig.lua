local mapkey = require("util.keymapper").mapkey
local diagnostic_signs = require("util.icons").diagnostic_signs
local typescript_organize_imports = require("util.lsp").typescript_organise_imports

local config = function()
	require("neoconf").setup({})
	local cmp_nvim_lsp = require("cmp_nvim_lsp")

	local lspconfig = require("lspconfig")

	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- enable keybinds only for when lsp server is available
	local on_attach = function(_, bufnr)
		-- keybind options
		local opts = { noremap = false, silent = true, buffer = bufnr }

		-- set keybinds
		mapkey("gf", "Lspsaga lsp_finder", "n", opts)
		mapkey("gD", "Lspsaga goto_definition", "n", opts)
		mapkey("gd", "Lspsaga peek_definition", "n", opts)
		mapkey("gi", "Lspsaga goto_implementation", "n", opts)
		mapkey("gt", "Lspsaga goto_type_definition", "n", opts)
		mapkey("K", "Lspsaga hover_doc", "n", opts)
		mapkey("<leader>lo", "Lspsaga outline", "n", opts)

		mapkey("<leader>ca", "Lspsaga code_action", "n", opts)
		mapkey("<leader>rn", "Lspsaga rename", "n", opts)

		-- mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts)
		-- mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts)
		mapkey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts)
		mapkey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts)

		-- typescript specific keymaps
	end

	-- lua LSP
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = { -- custom settings for lua
				-- make the language server recognize the "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- json
	lspconfig.jsonls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"json",
		},
	})

	-- typescript LSP
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"typescript",
			"javascript",
			"typescriptreact",
			"javascriptreact",
		},
		commands = {
			TypeScriptOrganizeImports = typescript_organize_imports,
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	-- bash
	lspconfig.bashls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"sh",
			"aliasrc",
		},
	})

	-- typescriptreact, javascriptreact, css, svelte
	lspconfig.emmet_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			-- "typescriptreact",
			-- "javascriptreact",
			-- "javascript",
			"css",
			"svelte",
			"html",
		},
	})

	-- rust
	lspconfig.rust_analyzer.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		filetypes = {
			"rust",
		},
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},
				checkOnSave = {
					command = "clippy",
					allTargets = false,
				},
			},
		},
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"typescript",
			"json",
			"sh",
			"javascript",
			"javascriptreact",
			"typescriptreact",
			"svelte",
			"html",
			"css",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				typescript = { eslint_d, prettier_d },
				json = { eslint_d, fixjson },
				sh = { shellcheck, shfmt },
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				svelte = { eslint_d, prettier_d },
				html = { prettier_d },
				css = { prettier_d },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
	},
}

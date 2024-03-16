local mapkey = require("util.keymapper").mapkey

local on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	mapkey("gf", "Lspsaga lsp_finder", "n", opts)
	mapkey("gD", "Lspsaga goto_definition", "n", opts)
	mapkey("gd", "Lspsaga peek_definition", "n", opts)
	mapkey("gi", "Lspsaga goto_implementation", "n", opts)
	mapkey("K", "Lspsaga hover_doc", "n", opts)

	mapkey("[d", vim.diagnostic.goto_prev, "n", opts)
	mapkey("]d", vim.diagnostic.goto_next, "n", opts)
	mapkey("gC", vim.lsp.buf.declaration, "n", opts)
	mapkey("gr", vim.lsp.buf.references, "n", opts)
	mapkey("<C-k>", vim.lsp.buf.signature_help, "n", opts)
	mapkey("gT", vim.lsp.buf.type_definition, "n", opts)

	mapkey("<leader>ca", "Lspsaga code_action", "n", opts)
	mapkey("<leader>rn", "Lspsaga rename", "n", opts)
	mapkey("<leader>D", "Lspsaga show_line_diagnostics", "n", opts)
	mapkey("<leader>d", "Lspsaga show_cursor_diagnostics", "n", opts)
	mapkey("<leader>pd", "Lspsaga diagnostic_jump_prev", "n", opts)
	mapkey("<leader>nd", "Lspsaga diagnostic_jump_next", "n", opts)
	mapkey("<leader>lo", "LSoutlineTogg", "n", opts)

	-- typescript specific keymaps
	if client.name == "typescript" then
		-- organization imports
		mapkey("<leader>oi", "TypeScriptOrganizeImports", "n", opts)
	end

	-- local keymap = vim.keymap
	-- local opts = { noremap = true, silent = true, buffer = bufnr }
	--
	-- keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	-- keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	-- keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
	-- keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	-- keymap.set("n", "gr", vim.lsp.buf.references, opts)
	-- keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	-- keymap.set("n", "K", vim.lsp.buf.hover, opts)
	-- keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
	-- keymap.set("n", "<space>D", vim.lsp.buf.type_definition, opts)
	-- keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
	-- keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
end

local config = function()
	local lspconfig = require("lspconfig")
	local capabilities = require("cmp_nvim_lsp").default_capabilities()
	local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end

	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		capabalities = capabilities,
		settings = { -- custom settings for lua
			Lua = {
				runtime = {
					-- tell the language server which version of Lua you're using
					-- (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				-- make the server aware of Neovim runtime files
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME,
					},
				},
			},
		},
	})

	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabalities = capabilities,
	})

	lspconfig.tailwindcss.setup({})

	lspconfig.emmet_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig.jsonls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig.pyright.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					autoImportCompletions = true,
				},
			},
		},
	})

	lspconfig.bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	lspconfig.dockerls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettier_d = require("efmls-configs.formatters.prettier")
	local fixjson = require("efmls-configs.formatters.fixjson")
	local shfmt = require("efmls-configs.formatters.shfmt")
	local black = require("efmls-configs.formatters.black")

	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"html",
			"css",
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
			"json",
			"jsonc",
			"svelte",
			"vue",
			"python",
			"sh",
			"docker",
			"markdown",
			"yaml",
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
				javascript = { eslint_d, prettier_d },
				javascriptreact = { eslint_d, prettier_d },
				typescript = { eslint_d, prettier_d },
				typescriptreact = { eslint_d, prettier_d },
				svelte = { eslint_d, prettier_d },
				vue = { eslint_d, prettier_d },
				html = { prettier_d },
				css = { prettier_d },
				markdown = { prettier_d },
				json = { fixjson },
				jsonc = { fixjson },
				sh = { shfmt },
				python = { black },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	event = "BufReadPre",
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"creativenull/efmls-configs-nvim",
	},
	config = config,
}

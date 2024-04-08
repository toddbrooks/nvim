return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    local mason_tool_installer = require("mason-tool-installer")

    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "cssls",
        "graphql",
        "html",
        "lua_ls",
        "pyright",
        "svelte",
        "tailwindcss",
        "tsserver",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "black", -- python formatter
        "eslint_d",
        "isort", -- python formatter
        "prettier",
        "stylua", -- lua formatter
        "pylint", -- python linter
      }
    })

    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")

		-- setup cfn-lsp-extra
		if not configs["cfn-lsp-extra"] then
			configs["cfn-lsp-extra"] = {
				default_config = {
					cmd = { "cfn-lsp-extra" },
					filetypes = { "yaml.cloudformation", "json.cloudformation" },
					root_dir = function(fname)
						return lspconfig.util.find_git_ancestor(fname)
					end,
					settings = { validation = false },
				},
			}
		end
		lspconfig["cfn-lsp-extra"].setup({})
  end,
}

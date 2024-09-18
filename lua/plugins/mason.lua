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
        "terraformls",
        "ts_ls",
      },
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "black", -- python formatter
        "css-lsp",
        "eslint_d",
        "isort", -- python formatter
        "jsonlint", -- json linter
        "luacheck", -- lua linter
        "prettier",
        "shellcheck", -- shell linter
        "stylua", -- lua formatter
        "pylint", -- python linter
        "tailwindcss-language-server",
        "typescript-language-server", -- javascript/typescript language server
      }
    })

    local lspconfig = require("lspconfig")
    local configs = require("lspconfig.configs")

		-- setup cfn-lsp-extra
		if not configs["cfn-lsp-extra"] then
			configs["cfn-lsp-extra"] = {
				default_config = {
					cmd = { "cfn-lsp-extra" },
					filetypes = { "yaml", "yaml.ansible", "yaml.cloudformation", "json.cloudformation" },
					root_dir = function(fname)
						return lspconfig.util.find_git_ancestor(fname)
					end,
					settings = {
            yaml = {
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
              hover = false,
              validate = true,
              customTags = {
                "!And sequence",
                "!Base64 scalar",
                "!Cidr sequence",
                "!Condition",
                "!If sequence",
                "!Equals sequence",
                "!FindInMap sequence",
                "!GetAtt scalar",
                "!GetAZs scalar",
                "!ImportValue scalar",
                "!Join sequence scalar",
                "!Not sequence",
                "!Or sequence",
                "!Ref scalar",
                "!Select sequence",
                "!Split sequence",
                "!Sub sequence scalar",
              },
            },
          },
				},
			}
		end
		lspconfig["cfn-lsp-extra"].setup({})
  end,
}

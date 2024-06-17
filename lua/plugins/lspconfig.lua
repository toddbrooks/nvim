return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Show LSP references"
        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts)

        opts.desc = "Open LSP messages in floating window"
        keymap.set("n", "gO", vim.diagnostic.open_float, opts)

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    mason_lspconfig.setup_handlers({
      -- default handler for installed servers
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end,

      ["tsserver"] = function()
        -- configure typescript language server
        lspconfig["tsserver"].setup({
          capabilities = capabilities,
          filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact" },
          single_file_support = true,
          settings = {
            -- make the language server use the workspace version of typescript
            typescript = {
              preferences = {
                importModuleSpecifierPreference = "relative",
              },
              inlayHints = {
								includeInlayParameterNameHints = "literal",
								includeInlayParameterNameHintsWhenArgumentMatchesName = false,
								includeInlayFunctionParameterTypeHints = true,
								includeInlayVariableTypeHints = false,
								includeInlayPropertyDeclarationTypeHints = true,
								includeInlayFunctionLikeReturnTypeHints = true,
								includeInlayEnumMemberValueHints = true,
							},
            },
            javascript = {
              preferences = {
                importModuleSpecifierPreference = "relative",
              },
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        })
      end,

      ["svelte"] = function()
        -- configure svelte server
        lspconfig["svelte"].setup({
          capabilities = capabilities,
          on_attach = function(client, _)
            vim.api.nvim_create_autocmd("BufWritePost", {
              pattern = { "*.js", "*.ts" },
              callback = function(ctx)
                -- Here use ctx.match instead of ctx.file
                client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
              end,
            })
          end,
        })
      end,

      -- ["emmet_ls"] = function()
      --   -- configure emmet language server
      --   lspconfig["emmet_ls"].setup({
      --     capabilities = capabilities,
      --     filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
      --   })
      -- end,

      ["lua_ls"] = function()
        -- configure lua server (with special settings)
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          settings = {
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        })
      end,

      ["cssls"] = function()
        -- configure css language server
        lspconfig["cssls"].setup({
          capabilities = capabilities,
          filetypes = { "css", "sass", "scss", "less", "svelte" },
        })
      end,

      ["jsonls"] = function()
        -- configure json language server
        lspconfig["jsonls"].setup({
          capabilities = capabilities,
          filetypes = { "json", "jsonc" },
        })
      end,

      ["tailwindcss"] = function()
        -- configure tailwindcss language server
        lspconfig["tailwindcss"].setup({
          capabilities = capabilities,
          filetypes = { "html", "css", "scss", "svelte" },
        })
      end,

      ["html"] = function()
        -- configure html language server
        lspconfig["html"].setup({
          capabilities = capabilities,
          filetypes = { "html", "svelte" },
        })
      end,

      ["yamlls"] = function()
        -- configure yaml language server
        lspconfig["yamlls"].setup({
          capabilities = capabilities,
					filetypes = { "yaml", "yaml.ansible", "yaml.cloudformation", "json.cloudformation" },
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
        })
      end,

      ["bashls"] = function()
        -- configure bash language server
        lspconfig["bashls"].setup({
          capabilities = capabilities,
          filetypes = { "sh", "bash" },
        })
      end,

      ["terraformls"] = function()
        -- configure Hashicorp Terraform language server
        lspconfig["terraformls"].setup({
          capabilities = capabilities,
          filetypes = { "terraform" },
        })
      end,
    })
  end,
}

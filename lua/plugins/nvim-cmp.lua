return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source for text in buffer
    "hrsh7th/cmp-path", -- source for file system paths
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
    },
    "saadparwaiz1/cmp_luasnip", -- for autocompletion
    "rafamadriz/friendly-snippets", -- useful code-snippets
    "onsails/lspkind.nvim", -- vs-code like pictogram
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      completion = {
        completeopt = "menu,menuone,preview,noselect",
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        -- ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        -- ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
        -- ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        -- ["<esc>"] = cmp.mapping.abort(), -- close completion window
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion - order matters
      sources = cmp.config.sources({
        { name = "nvim_lsp" }, -- LSP
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),
      window = {
        completion = {
          -- winhighlight = "Normal:CmpNormal,FloatBorder:Pmenu,Search:None",
          winhighlight = "Normal:CmpNormal",
          col_offset = -3,
          side_padding = 0,
          border = "rounded",
        },
      },
      formatting = {
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
        fields = { "kind", "abbr", "menu" },
        expandable_indicator = true,
      },
    })

    luasnip.add_snippets("all", {
      luasnip.snippet("aws", {
        luasnip.text_node("AWSTemplateFormatVersion: '2010-09-09'"),
      }),
      luasnip.snippet("transform", {
        luasnip.text_node("Transform: AWS::Serverless-2016-10-31"),
      }),
    })
  end,
}

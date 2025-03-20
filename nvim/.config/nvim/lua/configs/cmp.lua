local cmp = require("cmp")
local lspkind = require("lspkind")

return {
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = lspkind.cmp_format({
      mode = "symbol_text",
      maxwidth = 50,
      ellipsis_char = "...",
      symbol_map = { Codeium = "󰭻" },
      menu = {
        nvim_lsp = "[LSP]",
        buffer = "[Buffer]",
        luasnip = "[Snippet]",
        path = "[Path]",
        codeium = "[Codeium]",
        cmdline = "[Cmdline]",
        dotenv = "[Env]",
      },
    }),
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  }),

  sources = cmp.config.sources({
    {
      name = "nvim_lsp",
      priority = 1000,
    },
    {
      name = "buffer",
      priority = 900,
    },
    {
      name = "luasnip",
      priority = 800,
    },
    {
      name = "path",
      priority = 700,
    },
    {
      name = "codeium",
      priority = 600,
    },
    {
      name = "cmdline",
      priority = 500,
    },
    {
      name = "dotenv",
      priority = 400,
    },
  }),

  cmdline = {
    search = {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    },
    command = {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({ { name = "path" } }, {
        {
          name = "cmdline",
          option = {
            ignore_cmds = {
              "Man",
              "!",
              "q",
              "x",
            },
          },
        },
      }),
    },
  },
}

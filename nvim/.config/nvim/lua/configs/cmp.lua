return {
  formatting = {
    format = function(entry, vim_item)
      -- Use a simple format without lspkind for now, since we're skipping LSP
      vim_item.menu = ({
        buffer = "[Buffer]",
        path = "[Path]",
        luasnip = "[Snippet]",
        cmdline = "[Cmdline]",
        dotenv = "[Env]",
        codeium = "[Codeium]",
      })[entry.source.name]
      return vim_item
    end,
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  window = {
    completion = require("cmp").config.window.bordered(),
    documentation = require("cmp").config.window.bordered(),
  },
  mapping = require("cmp").mapping.preset.insert({
    ["<C-b>"] = require("cmp").mapping.scroll_docs(-4),
    ["<C-f>"] = require("cmp").mapping.scroll_docs(4),
    ["<C-Space>"] = require("cmp").mapping.complete(),
    ["<C-e>"] = require("cmp").mapping.abort(),
    ["<CR>"] = require("cmp").mapping.confirm({ select = true }),
  }),
  sources = require("cmp").config.sources({
    {
      name = "luasnip",
      priority = 850,
    },
    {
      name = "buffer",
      priority = 750,
    },
    {
      name = "path",
      priority = 650,
    },
    {
      name = "codeium",
      priority = 550,
    },
    {
      name = "cmdline",
      priority = 450,
    },
    {
      name = "dotenv",
      priority = 350,
    },
  }),
  -- Command line setup
  cmdline = {
    search = {
      mapping = require("cmp").mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    },
    command = {
      mapping = require("cmp").mapping.preset.cmdline(),
      sources = require("cmp").config.sources(
        { { name = "path" } }, 
        {
          {
            name = "cmdline",
            option = { 
              ignore_cmds = {
                "Man",
                "!",
                "q",
                "x",
              } 
            },
          },
        }
      ),
    },
  }
}

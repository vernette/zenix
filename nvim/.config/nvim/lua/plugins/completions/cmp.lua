return {
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
      "Zeioth/NormalSnippets",
    },
    event = "InsertEnter",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
  { "hrsh7th/cmp-nvim-lsp", event = "LspAttach" },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-cmdline" },
      { "SergioRibera/cmp-dotenv" },
      { "onsails/lspkind.nvim" },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      local cmp = require("cmp")
      local opts = require("configs.cmp")

      -- Main completion
      cmp.setup(opts)

      -- Completion for search
      cmp.setup.cmdline("/", opts.cmdline.search)

      -- Completion for commands
      cmp.setup.cmdline(":", opts.cmdline.command)
    end,
  },
}

return {
  "L3MON4D3/LuaSnip",
  dependencies = {
    "rafamadriz/friendly-snippets",
    "Zeioth/NormalSnippets",
  },
  event = "InsertEnter",
  config = function()
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}

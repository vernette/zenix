return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    lazy = false,
    opts = require("configs.mason-tool-installer"),
  },
}

return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = require("configs.mason")
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    event = "VeryLazy",
    opts = require("configs.mason-tool-installer")
  }
}

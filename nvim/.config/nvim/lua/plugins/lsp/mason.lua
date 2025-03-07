return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = require("configs.mason")
  },
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
    opts = require("configs.mason-lspconfig")
  }
}

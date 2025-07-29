return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    opts = require("configs.mason"),
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = require("configs.mason-tool-installer"),
  },
}

return {
  "stevearc/conform.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = require("configs.conform"),
}

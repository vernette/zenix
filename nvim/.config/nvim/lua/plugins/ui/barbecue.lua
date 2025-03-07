return {
  "utilyre/barbecue.nvim",
  dependencies = { "SmiteshP/nvim-navic" },
  event = "BufReadPre",
  opts = require("configs.barbecue")
}

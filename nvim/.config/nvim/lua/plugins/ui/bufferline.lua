return {
  "akinsho/bufferline.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = require("configs.bufferline"),
}

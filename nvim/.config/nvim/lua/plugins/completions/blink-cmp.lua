return {
  "saghen/blink.cmp",
  dependencies = { "onsails/lspkind.nvim" },
  version = "1.4.0",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = require("configs.blink-cmp"),
}

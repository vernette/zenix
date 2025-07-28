return {
  {
    "saghen/blink.compat",
    version = "2.*",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    dependencies = {
      "onsails/lspkind.nvim",
      "SergioRibera/cmp-dotenv",
    },
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = require("configs.blink-cmp"),
  },
  {
    "milanglacier/minuet-ai.nvim",
    lazy = true,
    opts = require("configs.minuet-ai"),
  },
}

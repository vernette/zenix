return {
  {
    "Zeioth/compiler.nvim",
    dependencies = {
      "stevearc/overseer.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = {
      "CompilerOpen",
      "CompilerToggleResults",
      "CompilerRedo",
    },
    opts = {},
  },
  {
    "stevearc/overseer.nvim",
    cmd = {
      "CompilerOpen",
      "CompilerToggleResults",
      "CompilerRedo",
    },
    opts = require("configs.overseer"),
  },
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  branch = "v3.x",
  cmd = "Neotree",
  opts = require("configs.neo-tree"),
}

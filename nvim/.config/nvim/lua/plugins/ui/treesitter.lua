return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local opts = require("configs.treesitter")
    require("nvim-treesitter.configs").setup(opts)
  end,
}

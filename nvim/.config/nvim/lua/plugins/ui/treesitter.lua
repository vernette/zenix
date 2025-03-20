return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    local opts = require("configs.treesitter")
    require("nvim-treesitter.configs").setup(opts)
  end,
}

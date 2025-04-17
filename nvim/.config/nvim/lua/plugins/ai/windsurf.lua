return {
  "Exafunction/windsurf.nvim",
  event = "InsertEnter",
  config = function()
    local opts = require("configs.windsurf")
    require("codeium").setup(opts)
  end,
}

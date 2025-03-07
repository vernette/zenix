return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "piersolenski/telescope-import.nvim" },
  },
  event = "VeryLazy",
  config = function()
    local telescope = require("telescope")
    telescope.setup(require("configs.telescope"))
    telescope.load_extension("ui-select")
    telescope.load_extension("import")
  end
}

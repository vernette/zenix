return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "piersolenski/telescope-import.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  cmd = "Telescope",
  config = function()
    local telescope = require("telescope")
    telescope.setup(require("configs.telescope"))
    telescope.load_extension("import")
    telescope.load_extension("fzf")
  end,
}

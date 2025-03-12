return {
  view = {
    side = "left",
    width = {
      min = 40,
      max = 50,
      padding = 10,
    },
  },

  renderer = {
    highlight_git = "name",
    highlight_opened_files = "name",
    root_folder_label = ":t",

    indent_markers = {
      enable = true,
      inline_arrows = false,
    },

    icons = { git_placement = "after" },
  },

  actions = { open_file = { resize_window = false } },

  filters = { dotfiles = false },
}

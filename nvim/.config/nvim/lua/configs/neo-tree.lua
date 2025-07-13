return {
  close_if_last_window = true,

  window = {
    position = "left",
    auto_expand_width = true,
  },

  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 2,
    },
  },

  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = true,
      hide_gitignored = true,
    },
  },
}

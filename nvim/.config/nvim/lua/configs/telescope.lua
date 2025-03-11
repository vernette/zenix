return {
  -- TODO: Customize pickers
  pickers = {
    find_files = { hidden = true },
    colorscheme = {
      enable_preview = true,
      ignore_builtins = true,
    },
  },

  extensions = {
    ["ui-select"] = { require("telescope.themes").get_dropdown({}) },
    import = { insert_at_top = true },
    fzf = {}
  },

  defaults = {
    prompt_prefix = " ",
    selection_caret = "󱞩 ",
    path_display = { "smart" },

    file_ignore_patterns = {
      "venv",
      ".venv",
      "node_modules",
    },

    layout_config = {
      vertical = {
        preview_cutoff = 0,
        preview_height = 0.5,
      },
      horizontal = {
        preview_cutoff = 0,
        preview_width = 0.6,
      },
    },
  },
}

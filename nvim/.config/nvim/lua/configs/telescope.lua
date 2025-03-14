local default_preview_cutoff = 0

return {
  pickers = {
    colorscheme = {
      enable_preview = true,
      ignore_builtins = true,
    },

    current_buffer_fuzzy_find = { sorting_strategy = "ascending" },

    buffers = {
      theme = "dropdown",
      previewer = false,
    },
  },

  extensions = {
    ["ui-select"] = { require("telescope.themes").get_cursor({}) },
    import = { insert_at_top = true },
    fzf = {},
  },

  defaults = {
    layout_strategy = "horizontal",
    prompt_prefix = " ",
    selection_caret = "󱞩 ",
    path_display = { "smart" },

    file_ignore_patterns = {
      "venv",
      ".venv",
      "__pycache__",
      "node_modules",
    },

    layout_config = {
      vertical = { preview_cutoff = default_preview_cutoff },
      horizontal = { preview_cutoff = default_preview_cutoff },
    },
  },
}

local default_preview_cutoff = 0
local default_preview_value = 0.5
local custom_preview_value = 0.8

local custom_layout_config = {
  horizontal = {
    preview_cutoff = default_preview_cutoff,
    preview_width = custom_preview_value,
  },
}

return {
  pickers = {
    find_files = { layout_config = custom_layout_config },

    oldfiles = { layout_config = custom_layout_config },

    colorscheme = {
      enable_preview = true,
      ignore_builtins = true,
      layout_config = custom_layout_config,
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
      vertical = {
        preview_cutoff = default_preview_cutoff,
        preview_height = default_preview_value,
      },
      horizontal = {
        preview_cutoff = default_preview_cutoff,
        preview_width = default_preview_value,
      },
    },
  },
}

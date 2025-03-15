return {
  -- Mostly from https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/telescope.lua
  pickers = {
    colorscheme = {
      enable_preview = true,
      ignore_builtins = true,
    },
  },

  defaults = {
    border = false,
    prompt_prefix = "   ",
    selection_caret = " 󱞩 ",
    entry_prefix = " ",
    path_display = { "smart" },
    sorting_strategy = "ascending",

    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
      width = 0.87,
      height = 0.80,
    },

    file_ignore_patterns = {
      "venv",
      ".venv",
      "__pycache__",
      "node_modules",
    },
  },

  extensions = {
    ["ui-select"] = { require("telescope.themes").get_cursor({}) },
    import = { insert_at_top = true },
    fzf = {},
  },
}

return {
  -- Mostly from https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/telescope.lua
  pickers = {
    colorscheme = {
      enable_preview = true,
      ignore_builtins = true,
    },
  },

  defaults = {
    prompt_prefix = "   ",
    selection_caret = " 󱞩 ",
    entry_prefix = " ",
    path_display = { "filename_first" },
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
      ".cargo",
      ".librewolf",
      ".git",
      ".venv",
      "venv",
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

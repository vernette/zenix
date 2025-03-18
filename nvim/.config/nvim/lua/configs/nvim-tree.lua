local function create_root_folder_label(path)
  local parent = vim.fn.fnamemodify(path, ":h:t")
  local current = vim.fn.fnamemodify(path, ":t")
  return parent .. "/" .. current
end

return {
  -- Mostly from https://github.com/NvChad/NvChad/blob/v2.5/lua/nvchad/configs/nvimtree.lua
  filters = { dotfiles = false },
  disable_netrw = true,
  hijack_cursor = true,
  sync_root_with_cwd = true,

  update_focused_file = {
    enable = true,
    update_root = false,
  },

  view = {
    side = "left",
    preserve_window_proportions = true,
    width = {
      max = 50,
      padding = 10,
    },
  },

  renderer = {
    root_folder_label = create_root_folder_label,
    highlight_git = "name",
    highlight_opened_files = "name",

    indent_markers = {
      enable = true,
      inline_arrows = false,
    },

    icons = {
      git_placement = "after",
      glyphs = {
        default = "󰈚",
        folder = {
          default = "",
          empty = "",
          empty_open = "",
          open = "",
          symlink = "",
        },
        git = { unmerged = "" },
      },
    },
  },

  actions = { open_file = { resize_window = false } },
}

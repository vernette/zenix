return {
  options = {
    globalstatus = true,
    section_separators = "",
    component_separators = "",
    disabled_filetypes = { "alpha" },
  },

  sections = {
    lualine_a = {
      {
        "mode",
        icon = "",
      },
    },

    lualine_b = {
      {
        "branch",
        icon = "",
      },
    },

    -- TODO: Refactor this section
    lualine_c = {
      {
        "diff",
        separator = "|",
        symbols = {
          added = " ",
          modified = " ",
          removed = " ",
        },
      },
      {
        "diagnostics",
        separator = "|",
        padding = { left = 1, right = 1 },
        update_in_insert = true,
        symbols = {
          error = " ",
          warn = " ",
          info = " ",
          hint = " ",
        },
      },
      {
        "filetype",
        padding = { left = 1 },
      },
    },

    lualine_x = {
      {
        "lsp_status",
        icon = "󰂖 LSP:",
        symbols = { separator = ", " },
      },
    },

    lualine_y = {
      {
        "location",
        icon = "",
      },
    },

    lualine_z = { { "progress" } },
  },

  extensions = {
    "lazy",
    "mason",
    "neo-tree",
    "nvim-dap-ui",
    "toggleterm",
    "trouble",
  },
}

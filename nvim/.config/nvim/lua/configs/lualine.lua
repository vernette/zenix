local get_active_formatters = function()
  local conform = require("conform")
  local formatters = conform.list_formatters_for_buffer()

  if formatters and #formatters > 0 then
    local formatter_names = {}

    for _, formatter in ipairs(formatters) do
      table.insert(formatter_names, formatter)
    end

    return "󰷈 Conform: " .. table.concat(formatter_names, ", ")
  end

  return ""
end

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
        get_active_formatters,
        separator = "|",
      },
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
    "nvim-tree",
    "nvim-dap-ui",
    "toggleterm",
    "trouble",
  },
}

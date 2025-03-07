local highlight = { "CursorColumn" }

return {
  indent = {
    highlight = highlight,
    char = "│",
    tab_char = "│",
  },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  scope = { enabled = false },
  exclude = {
    filetypes = {
      "help",
      "lazy",
      "mason",
      "notify",
      "toggleterm",
    },
  },
}

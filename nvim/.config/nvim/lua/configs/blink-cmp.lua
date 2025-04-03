return {
  keymap = { preset = "super-tab" },
  cmdline = { enabled = true },
  completion = {
    -- Enable auto brackets
    accept = { auto_brackets = { enabled = true } },
  },
  sources = {
    default = {
      "lsp",
      "buffer",
      "snippets",
      "path",
    },
  },
  fuzzy = { implementation = "prefer_rust" },
}

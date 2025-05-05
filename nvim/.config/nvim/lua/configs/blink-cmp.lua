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
      "codeium",
    },
    providers = {
      codeium = {
        name = "Codeium",
        module = "codeium.blink",
        async = true,
      },
    },
  },
  fuzzy = { implementation = "prefer_rust" },
}

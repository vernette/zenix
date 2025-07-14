return {
  appearance = {
    nerd_font_variant = "normal",
  },

  keymap = { preset = "super-tab" },

  fuzzy = {
    implementation = "prefer_rust",
  },

  completion = {
    accept = { auto_brackets = { enabled = true } },
  },

  cmdline = {
    keymap = { preset = "inherit" },
    completion = { menu = { auto_show = true } },
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
      lsp = {
        score_offset = 100,
      },

      snippets = {
        score_offset = 80,
      },

      buffer = {
        score_offset = 60,
      },

      codeium = {
        name = "Codeium",
        module = "codeium.blink",
        async = true,
        score_offset = 40,
      },

      path = {
        score_offset = 20,
      },
    },
  },
}

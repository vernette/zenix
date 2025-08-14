return {
  appearance = { nerd_font_variant = "normal" },

  keymap = { preset = "super-tab" },

  fuzzy = { implementation = "prefer_rust" },

  completion = {
    accept = { auto_brackets = { enabled = true } },
    ghost_text = { enabled = true },

    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },

    menu = {
      draw = {
        columns = {
          { "kind_icon" },
          {
            "label",
            "label_description",
            "source_name",
            gap = 1,
          },
        },

        components = {
          source_name = {
            text = function(ctx)
              return "[" .. ctx.source_name .. "]"
            end,
            highlight = "BlinkCmpSource",
          },
        },
      },
    },
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
      -- "minuet",
    },

    providers = {
      lsp = {
        max_items = 10,
        score_offset = 100,
      },

      codeium = {
        name = "Codeium",
        module = "codeium.blink",
        async = true,
        max_items = 5,
        score_offset = 80,
      },

      minuet = {
        enabled = false,
        name = "minuet",
        module = "minuet.blink",
        async = true,
        timeout_ms = 3000,
        score_offset = 80,
      },

      snippets = {
        max_items = 3,
        score_offset = 60,
      },

      buffer = {
        max_items = 10,
        score_offset = 40,
      },

      path = { score_offset = 20 },
    },
  },
}

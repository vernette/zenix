return {
  default_config = function(client, bufnr)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go to Declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Go to Definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Show Hover Information" })
  end,

  servers = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
          workspace = {
            library = {
              vim.fn.expand("$VIMRUNTIME/lua"),
              vim.fn.stdpath("config") .. "/lua",
            },
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    },
    basedpyright = {
      on_attach = function(client, bufnr)
        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
      end,
      settings = {
        basedpyright = {
          disableTaggedHints = true,
          disableOrganizeImports = true,
        },

        python = {
          analysis = {
            -- Ignore all files for analysis to exclusively use Ruff for linting
            ignore = { '*' },
          },
        }
      },
    },
    ruff = {
      init_options = {
        settings = {
          lint = {
            select = {
              -- https://docs.astral.sh/ruff/rules
              "E",
              "F",
              "UP",
              "N",
              "I",
              "ASYNC",
              "S",
              "PTH",
              "B",
              "W",
              "Q",
              "C",
              -- "D", -- Missing docstring in public module
              "T10",
              "R",
              "G",
              "PT"
            },
            ignore = {"Q000"},
            ["line-length"] = 79,
          },

          format = {
            -- TODO: Add settings for quotes
            ["line-length"] = 79,
          },
        }
      }
    },
  },
}

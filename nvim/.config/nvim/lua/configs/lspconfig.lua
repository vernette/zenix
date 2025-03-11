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
          telemetry = { enable = false },
          format = { enable = false },
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
            ignore = { "*" },
          },
        },
      },
    },

    ruff = {}, -- For linting and code actions, formatter is configured in configs/conform.lua
    bashls = {},
    dockerls = {},
    nil_ls = {},
  },
}

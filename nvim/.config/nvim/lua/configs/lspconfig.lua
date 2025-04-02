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
          diagnostics = { enable = false },
          format = { enable = false },
          workspace = { library = vim.api.nvim_get_runtime_file("lua", true) },
        },
      },
    },

    jedi_language_server = {},

    ruff = {
      init_options = {
        settings = {
          format = { enable = false },
          lint = { enable = false },
        },
      },
    }, -- For code actions, formatter is configured in configs/conform.lua, linter is configured in configs/nvim-lint.lua

    bashls = {},
    dockerls = {},
    nil_ls = {},
    yamlls = {},
    jsonls = {},
    harper_ls = {},
  },
}

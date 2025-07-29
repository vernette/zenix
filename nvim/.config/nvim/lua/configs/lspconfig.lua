local mappings = require("core.mappings")

return {
  default_config = function(client, bufnr)
    mappings.setup_lsp_mappings(bufnr)
  end,

  servers = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = { enable = false },
          format = { enable = false },
          -- Enable nvim lua api
          -- workspace = { library = vim.api.nvim_get_runtime_file("lua", true) },
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
  },
}

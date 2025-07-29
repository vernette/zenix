return {
  -- For code actions. Formatter is configured in configs/conform.lua, linter is configured in configs/nvim-lint.lua
  cmd = {
    "ruff",
    "server",
  },
  filetypes = { "python" },
  init_options = {
    settings = {
      format = { enable = false },
      lint = { enable = false },
    },
  },
}

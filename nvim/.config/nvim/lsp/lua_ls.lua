return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = { enable = false },
      format = { enable = false },
      hint = { enable = true },
      -- Enable nvim lua api (may reduce load time of lua files)
      -- workspace = { library = vim.api.nvim_get_runtime_file("lua", true) },
    },
  },
}

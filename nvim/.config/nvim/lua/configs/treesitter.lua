local is_large_file = function(lang, bufnr)
  local filename = vim.api.nvim_buf_get_name(bufnr)
  if filename ~= "" then
    local file_size = vim.fn.getfsize(filename)
    local size_limit = 2 * 1024 * 1024 -- 2MB
    return file_size > size_limit
  end
end

return {
  auto_install = true,

  ensure_installed = {
    "python",
    "bash",
    "lua",
    "json",
    "jsonc",
    "yaml",
    "toml",
    "dockerfile",
  },

  indent = {
    enable = true,
    disable = is_large_file,
  },

  highlight = {
    enable = true,
    disable = is_large_file,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  incremental_selection = {
    enable = true,
    disable = is_large_file,
    keymaps = {
      init_selection = "<C-s>",
      node_incremental = "<C-s>",
      scope_incremental = false,
      node_decremental = "<Backspace>",
    },
  },

  nvim_biscuits = {
    enable = true,
    disable = is_large_file,
  },
}

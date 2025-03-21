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
    "markdown",
    "markdown_inline",
    "json",
    "jsonc",
    "yaml",
    "hyprlang",
    "gitcommit",
    "git_config",
    "gitignore",
    "dockerfile",
    "nix",
    "sql",
    "css",
    "html",
    "javascript",
    "http",
    "jq",
    "requirements",
    "ssh_config",
    "toml",
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
      init_selection = "<C-w>",
      node_incremental = "<C-w>",
      scope_incremental = false,
      node_decremental = "<Backspace>",
    },
  },
}

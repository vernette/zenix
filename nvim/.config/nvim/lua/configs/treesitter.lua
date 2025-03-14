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
  },

  indent = { enable = true },

  highlight = {
    enable = true,
    disable = function(lang, bufnr)
      local filename = vim.api.nvim_buf_get_name(bufnr)
      if filename ~= "" then
        local file_size = vim.fn.getfsize(filename)
        local size_limit = 2 * 1024 * 1024 -- 2MB
        return file_size > size_limit
      end
    end,
  },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-w>",
      node_incremental = "<C-w>",
      scope_incremental = false,
      node_decremental = "<Backspace>",
    },
  },
}

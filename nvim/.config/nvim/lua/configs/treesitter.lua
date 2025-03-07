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
    disable = function(lang, bufnr) -- Disable in large JSON buffers
      return lang == "json" and vim.api.nvim_buf_line_count(bufnr) > 50000
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

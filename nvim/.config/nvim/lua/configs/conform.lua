return {
  formatters_by_ft = {
    python = { "ruff_format" },
    lua = { "stylua" },
    sh = { "shfmt" },
    json = { "prettierd" },
    jsonc = { "prettierd" },
    yaml = { "prettierd" },
    javascript = { "prettierd" },
    html = { "prettierd" },
    css = { "prettierd" },
    markdown = { "prettierd" },
    nix = { "alejandra" },
  },
  formatters = {
    ruff_format = {
      prepend_args = {
        "format",
        "--respect-gitignore",
        "--line-length",
        "79",
        "--config",
        "format.quote-style = 'single'",
      },
    },
    stylua = {
      prepend_args = {
        "--indent-type",
        "Spaces",
        "--column-width",
        "120",
        "--indent-width",
        "2",
      },
    },
    shfmt = {
      prepend_args = {
        "-i",
        "2",
        "-ci",
      },
    },
  },
  format = {
    async = true,
    lsp_fallback = true,
  },
}

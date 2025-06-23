return {
  formatters_by_ft = {
    python = { "ruff_format", "docformatter" },
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
    nginx = { "nginxfmt" },
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
        "--indent",
        "2",
        "--case-indent",
      },
    },
  },
  format = {
    async = true,
    lsp_fallback = true,
  },
}

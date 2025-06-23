return {
  formatters_by_ft = {
    python = { "ruff_format", "docformatter" },
    lua = { "stylua" },
    sh = { "shfmt" },
    json = { "prettier" },
    jsonc = { "prettier" },
    yaml = { "prettier" },
    javascript = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    markdown = { "prettier" },
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

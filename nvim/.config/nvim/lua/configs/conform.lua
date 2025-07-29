local utils = require("core.utils")

local ruff_args
local get_pyproject_path = utils.get_pyproject_path
local pyproject_path = get_pyproject_path()

if pyproject_path then
  ruff_args = {
    "format",
    "--config",
    pyproject_path,
    "--respect-gitignore",
  }
else
  ruff_args = {
    "format",
    "--respect-gitignore",
    "--line-length",
    "79",
    "--config",
    "format.quote-style = 'single'",
  }
end

return {
  formatters_by_ft = {
    python = { "ruff_format" },
    lua = { "stylua" },
    sh = { "shfmt" },
    json = { "fixjson", "biome" },
    jsonc = { "fixjson", "biome" },
    yaml = { "yamlfmt" },
    javascript = { "biome" },
    html = { "biome" },
    css = { "biome" },
    markdown = { "prettier" },
    nix = { "alejandra" },
    nginx = { "nginxfmt" },
    sql = { "sqruff" },
  },
  formatters = {
    ruff_format = {
      prepend_args = ruff_args,
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

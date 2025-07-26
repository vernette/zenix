local function get_pyproject_path()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir = vim.fn.fnamemodify(current_file, ":p:h")

  local found = vim.fs.find("pyproject.toml", {
    path = current_dir,
    upward = true,
    type = "file",
  })
  return found[1] -- nil or full path
end

local ruff_args
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

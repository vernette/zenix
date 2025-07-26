local lint = require("lint")

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
    "check",
    "--output-format",
    "json",
    "--config",
    pyproject_path,
    "--respect-gitignore",
    "--preview",
    "-",
  }
else
  ruff_args = {
    "check",
    "--output-format",
    "json",
    "--select",
    "E,F,UP,N,I,ASYNC,S,PTH,B,W,Q,C,R,G,PT",
    "--ignore",
    "Q000",
    "--line-length",
    "79",
    "--respect-gitignore",
    "--preview",
    "-",
  }
end

local ruff = lint.linters.ruff
ruff.args = ruff_args

return {
  linters_by_ft = {
    python = { "ruff", "mypy", "pydocstyle", "vulture" },
    lua = { "selene" },
    json = { "jsonlint" },
    yaml = { "yamllint" },
    dockerfile = { "hadolint" },
    nix = { "statix" },
    sql = { "sqruff" },
    html = { "htmlhint" },
    gitcommit = { "gitlint" },
  },
}

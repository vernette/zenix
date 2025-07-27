local lint = require("lint")
local utils = require("core.utils")

local ruff_args
local get_pyproject_path = utils.get_pyproject_path
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
    python = { "ruff", "mypy", "pydocstyle"},
    lua = { "selene" },
    json = { "biomejs" },
    yaml = { "yamllint" },
    dockerfile = { "hadolint" },
    nix = { "statix" },
    sql = { "sqruff" },
    html = { "htmlhint" },
    gitcommit = { "gitlint" },
  },
}

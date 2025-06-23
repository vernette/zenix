local lint = require("lint")

local ruff = lint.linters.ruff
ruff.args = {
  "check",
  "--output-format",
  "json",
  "--select",
  "E,F,UP,N,I,ASYNC,S,PTH,B,W,Q,C,D,R,G,PT",
  "--ignore",
  "Q000",
  "--line-length",
  "79",
  "--respect-gitignore",
  "--preview",
  "-",
}

return {
  linters_by_ft = {
    python = { "ruff", "mypy", "pydocstyle", "vulture" },
    lua = { "selene" },
    json = { "jsonlint" },
    yaml = { "yamllint" },
    dockerfile = { "hadolint" },
    nix = { "statix" },
    sql = { "sqlfluff" },
    html = { "htmlhint" },
  },
}

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
    python = { "ruff", "mypy" },
    lua = { "selene" },
    json = { "jsonlint" },
    yaml = { "yamllint" },
    dockerfile = { "hadolint" },
    bash = { "shellcheck" },
    nix = { "statix" },
    sql = { "sqlfluff" },
    html = { "htmlhint" },
  },
}

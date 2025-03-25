-- Apply codespell to all linters
local function with_codespell(linters)
  if type(linters) == "string" then
    linters = { linters }
  end

  local result = {}
  for _, linter in ipairs(linters) do
    table.insert(result, linter)
  end

  local has_codespell = false
  for _, linter in ipairs(result) do
    if linter == "codespell" then
      has_codespell = true
      break
    end
  end

  if not has_codespell then
    table.insert(result, "codespell")
  end

  return result
end

local base_linters_by_ft = {
  python = { "ruff", "mypy" },
  lua = { "selene" },
  json = { "jsonlint" },
  yaml = { "yamllint" },
  dockerfile = { "hadolint" },
  bash = { "shellcheck" },
  nix = { "statix" },
  sql = { "sqlfluff" },
  html = { "htmlhint" },
  text = {},
  markdown = {},
}

local linters_by_ft = {}
for lang, linters in pairs(base_linters_by_ft) do
  linters_by_ft[lang] = with_codespell(linters)
end

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
  "-"
}

return { linters_by_ft = linters_by_ft }

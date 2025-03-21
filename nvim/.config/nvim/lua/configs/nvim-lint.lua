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
  python = {}, -- ruff is configured in configs/lspconfig.lua, so codespell is used for grammar checking
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

return { linters_by_ft = linters_by_ft }

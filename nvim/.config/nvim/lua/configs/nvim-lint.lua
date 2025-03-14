return {
  linters_by_ft = {
    -- python = { "ruff" }, -- Configured in configs/lspconfig.lua
    lua = { "selene" },
    json = { "jsonlint" },
    yaml = { "yamllint" },
    dockerfile = { "hadolint" },
    bash = { "shellcheck" },
    nix = { "statix" },
  },
}

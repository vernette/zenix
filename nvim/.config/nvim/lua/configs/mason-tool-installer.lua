return {
  ensure_installed = {
    -- Lua
    "lua_ls",
    "stylua",

    -- Python
    "basedpyright",
    "ruff",

    -- Shell
    "bashls",
    "shellcheck",
    "shfmt",

    -- Dockerfile LSP
    "dockerls",

    -- Nix
    "nil_ls",
    "alejandra",

    -- JSON && YAML linters
    "hadolint",
    "biome",

    -- JavaScript, HTML, CSS, Markdown, JSON and YAML formatters
    "prettierd"
  },
}

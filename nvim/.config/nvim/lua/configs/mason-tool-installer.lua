return {
  ensure_installed = {
    -- LSP
    "lua_ls", -- Lua
    "jedi-language-server", -- Python
    "bashls", -- Bash
    "dockerls", -- Dockerfile
    -- "nil_ls", -- Nix
    "json-lsp", -- JSON
    "yaml-language-server", -- YAML

    -- Formatters
    "stylua", -- Lua
    "ruff", -- Python
    "pydocstyle", -- Python
    "docformatter", -- Python
    "shfmt", -- Shell
    -- "alejandra", -- Nix
    "prettier", -- CSS, HTML, JSON, JavaScript, Markdown, YAML, etc
    "nginx-config-formatter", -- Nginx

    -- Linters
    "mypy", -- Python
    "selene", -- Lua
    "shellcheck", -- Shell
    "hadolint", -- Dockerfile
    "jsonlint", -- JSON
    "yamllint", -- YAML
    -- statix for Nix, but it's not in Mason. Installed system-wide
    "sqruff", -- SQL
    "htmlhint", -- HTML
    "gitlint" -- Git commits
  },
}

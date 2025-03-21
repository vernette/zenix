return {
  ensure_installed = {
    -- LSP
    "lua_ls", -- Lua
    "basedpyright", -- Python
    "bashls", -- Bash
    "dockerls", -- Dockerfile
    "nil_ls", -- Nix
    "json-lsp", -- JSON
    "yaml-language-server", -- YAML

    -- Formatters
    "stylua", -- Lua
    "ruff", -- Python
    "shfmt", -- Shell
    "alejandra", -- Nix
    "prettierd", -- CSS, HTML, JSON, JavaScript, Markdown, YAML, etc

    -- Linters
    "selene", -- Lua
    "shellcheck", -- Shell
    "hadolint", -- Dockerfile
    "jsonlint", -- JSON
    "yamllint", -- YAML
    -- statix for Nix, but it's not in Mason. Installed system-wide
    "sqlfluff", -- SQL
    "htmlhint", -- HTML
    "codespell", -- Misspelled english words
  },
}

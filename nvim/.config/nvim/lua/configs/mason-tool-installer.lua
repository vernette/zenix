return {
  ensure_installed = {
    -- LSP
    "lua-language-server", -- Lua
    "pyright", -- Python
    "bash-language-server", -- Bash
    "dockerfile-language-server", -- Dockerfile
    -- "nil", -- Nix
    "json-lsp", -- JSON
    "yaml-language-server", -- YAML

    -- Formatters
    "stylua", -- Lua
    "ruff", -- Python
    "shfmt", -- Shell
    -- "alejandra", -- Nix
    "prettier", -- Markdown
    "biome", -- JSON, JavaScript, CSS, HTML
    "yamlfmt", -- YAML
    "taplo", -- TOML
    "nginx-config-formatter", -- Nginx

    -- Linters
    "selene", -- Lua
    "shellcheck", -- Shell
    "hadolint", -- Dockerfile
    "jsonlint", -- JSON
    "yamllint", -- YAML
    -- statix for Nix, but it's not in Mason. Installed system-wide
    "sqruff", -- SQL
    "htmlhint", -- HTML
    "gitlint", -- Git commits

    -- Tools
    "deno", -- required by peek.nvim
  },
}

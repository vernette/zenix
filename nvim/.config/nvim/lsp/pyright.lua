return {
  cmd = {
    "pyright-langserver",
    "--stdio",
  },
  filetypes = { "python" },
  root_markers = {
    ".git",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
  },
  settings = {
    pyright = { disableOrganizeImports = true },
    python = {
      analysis = {
        ignore = { "*" },
        typeCheckingMode = "off"
      },
    },
  },
}

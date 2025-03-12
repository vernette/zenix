return {
  defaults = { lazy = true },

  spec = {
    { import = "plugins.colorschemes" },
    { import = "plugins.ui" },
    { import = "plugins.misc" },
    { import = "plugins.lsp" },
    { import = "plugins.ai" },
    { import = "plugins.markdown" },
    { import = "plugins.completions" },
    { import = "plugins.git" },
  },

  install = { colorscheme = { "tokyonight" } },

  ui = {
    border = "rounded",
    icons = {
      ft = "",
      lazy = "󰂠 ",
      loaded = "",
      not_loaded = "",
    },
  },

  performance = {
    rtp = {
      disabled_plugins = {
        "2html_plugin",
        "tohtml",
        "getscript",
        "getscriptPlugin",
        "gzip",
        "logipat",
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
        "matchit",
        "tar",
        "tarPlugin",
        "rrhelper",
        "spellfile_plugin",
        "vimball",
        "vimballPlugin",
        "zip",
        "zipPlugin",
        "tutor",
        "rplugin",
        "syntax",
        "synmenu",
        "optwin",
        "compiler",
        "bugreport",
        "ftplugin",
      },
    },
  },

  change_detection = { enabled = false },

  checker = {
    enabled = true,
    notify = false,
  },
}

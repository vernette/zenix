local opt = vim.opt

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smarttab = true
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- Scrolloff
opt.scrolloff = 30
opt.sidescrolloff = 50

-- Search
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.cursorline = true
opt.showmode = false
opt.statuscolumn = " %s %l  "
opt.inccommand = "split"
opt.termguicolors = true
opt.foldenable = true
opt.foldlevelstart = 99

-- Etc
opt.fileencoding = "utf-8"
opt.laststatus = 3
opt.clipboard = "unnamedplus"
opt.fillchars = { eob = " " }
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400
opt.undofile = true
opt.swapfile = false
opt.wrap = false

-- Disable nvim intro
opt.shortmess:append("sI")

-- Set the font for Neovide
opt.guifont = "JetBrainsMono\\ Nerd\\ Font:h10"

vim.filetype.add({
  extension = {
    -- Recognize files with the .http extension as HTTP files
    ["http"] = "http",
  },
  pattern = {
    [".*/waybar/config"] = "jsonc",
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".*/hypr/configs/.*%.conf"] = "hyprlang",
  },
  filename = {
    ["Caddyfile"] = "caddy",
  },
})

-- Add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

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
opt.so = 30
opt.sidescrolloff = 50

-- Search
opt.ignorecase = true
opt.smartcase = true

-- UI
opt.cursorline = true
opt.showmode = false
opt.signcolumn = "yes"

-- Etc
opt.laststatus = 3
opt.clipboard = "unnamedplus"
opt.fillchars = { eob = " " }
opt.mouse = "a"
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 400
opt.undofile = true
opt.swapfile = false

-- Disable nvim intro
opt.shortmess:append("sI")

-- Uncomment the following line to set the font for Neovide
-- opt.guifont = "JetBrainsMono Nerd Font"

-- Recognize files with the .http extension as HTTP files
vim.filetype.add({
  extension = {
    ["http"] = "http",
  },
  pattern = {
    [".*/waybar/config"] = "jsonc",
    [".*/hypr/.*%.conf"] = "hyprlang",
    [".*/hypr/configs/.*%.conf"] = "hyprlang",
  },
})

-- Add binaries installed by mason.nvim to path
local is_windows = vim.fn.has("win32") ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath("data"), "mason", "bin" }, sep) .. delim .. vim.env.PATH

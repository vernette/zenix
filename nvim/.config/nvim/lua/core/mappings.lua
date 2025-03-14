local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffers navigation
map("n", "[b", ":bnext<CR>", { desc = "Previous Buffer" })
map("n", "]b", ":bprevious<CR>", { desc = "Next Buffer" })

-- Better window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

map("n", "<Esc>", ":noh<CR>", { desc = "Clear Highlight" })

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

-- Oil
map("n", "-", ":Oil --float<CR>", { desc = "Open Current Directory in Oil" })

-- ToggleTerm
map("n", "<C-\\>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
map("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- Flash
map({ "n", "x", "o" }, "s", function()
  require("flash").jump()
end, { desc = "Flash" })

-- BufDelete
map("n", "<A-w>", function()
  require("bufdelete").bufdelete(0, true)
end, { desc = "Delete Current Buffer" })

-- IncRename
map("n", "<leader>ir", ":IncRename ", { desc = "Incremental Rename" })

-- Telescope
map("n", "<leader>th", ":Telescope colorscheme<CR>", { desc = "Choose Colorscheme" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>fw", ":Telescope live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>fo", ":Telescope oldfiles<CR>", { desc = "Show Recent Files" })
map("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "Show Buffers" })
map("n", "<leader>fcb", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Search in Current Buffer" })
map("n", "<leader>fgb", ":Telescope git_branches<CR>", { desc = "Show Git Branches" })
map("n", "<leader>fgc", ":Telescope git_commits<CR>", { desc = "Show Git Commits" })
map("n", "<leader>fgs", ":Telescope git_status<CR>", { desc = "Show Git Status" })
map("n", "<leader>fn", ":Telescope notify<CR>", { desc = "Show Notifications" })
map("n", "<leader>ft", ":TodoTelescope<CR>", { desc = "Show TODOs" })
map("n", "<leader>fi", ":Telescope import<CR>", { desc = "Show Imports" })

-- LSP
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "List Diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
map("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show Diagnostics" })
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Actions" })

-- Conform
map("n", "<leader>fm", function()
  require("conform").format({ async = true })
end, { desc = "Format Buffer" })

-- Outline
map("n", "<leader>ps", ":Outline<CR>", { desc = "Toggle Outline" })

-- Markdown
map("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })
map("n", "<leader>mr", ":Markview toggle<CR>", { desc = "Toggle Markdown Rendering" })

-- Gitsigns
map("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>", { desc = "Preview Hunk" })
map("n", "<leader>glb", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Current Line Git Blame" })
map("n", "<leader>gb", function()
  require("gitsigns").blame_line({ full = true })
end, { desc = "Show Git Blame" })

-- Fugitive
map("n", "<leader>gac", ":Gwrite<CR>", { desc = "Git Add Current File" })

-- Diffview
map("n", "<leader>gdo", ":DiffviewOpen<CR>", { desc = "Open Diffview" })
map("n", "<leader>gdc", ":DiffviewClose<CR>", { desc = "Close Diffview" })

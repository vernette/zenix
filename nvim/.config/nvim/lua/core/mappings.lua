local function map(mode, lhs, rhs, desc_or_opts)
  local opts = {}

  if type(desc_or_opts) == "string" then
    opts = { desc = desc_or_opts }
  elseif type(desc_or_opts) == "table" then
    opts = desc_or_opts
  end

  opts.silent = opts.silent ~= false

  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Buffers navigation
map("n", "]b", ":bnext<CR>", "Next Buffer")
map("n", "[b", ":bprevious<CR>", "Previous Buffer")

-- Better window navigation
map("n", "<C-h>", "<C-w>h", "Move left")
map("n", "<C-j>", "<C-w>j", "Move down")
map("n", "<C-k>", "<C-w>k", "Move up")
map("n", "<C-l>", "<C-w>l", "Move right")

map("n", "<Esc>", ":noh<CR>", "Clear Highlight")

-- NeoTree
map("n", "<C-n>", ":Neotree toggle<CR>", "Toggle NeoTree")
map("n", "<leader>e", ":Neotree focus<CR>", "Focus NeoTree")

-- Oil
map("n", "-", ":Oil --float<CR>", "Open Current Directory in Oil")

-- ToggleTerm
map("n", "<C-\\>", ":ToggleTerm<CR>", "Toggle Terminal")
map("t", "<esc>", [[<C-\><C-n>]], "Exit Terminal Mode")

-- Flash
map({ "n", "x", "o" }, "<leader>s", function()
  require("flash").jump()
end, "Flash")

-- BufDelete
map("n", "<A-w>", function()
  require("bufdelete").bufdelete(0, true)
end, "Delete Current Buffer")

-- Telescope
map("n", "<leader>th", ":Telescope colorscheme<CR>", "Choose Colorscheme")
map("n", "<leader>ff", ":Telescope find_files<CR>", "Find Files")
map("n", "<leader>fw", ":Telescope live_grep<CR>", "Live Grep")
map("n", "<leader>fo", ":Telescope oldfiles<CR>", "Show Recent Files")
map("n", "<leader>fb", ":Telescope buffers<CR>", "Show Buffers")
map("n", "<leader>fk", ":Telescope keymaps<CR>", "Show Keymaps")
map("n", "<leader>fcb", ":Telescope current_buffer_fuzzy_find<CR>", "Search in Current Buffer")
map("n", "<leader>fgf", ":Telescope git_files<CR>", "Show Git Files")
map("n", "<leader>fgb", ":Telescope git_branches<CR>", "Show Git Branches")
map("n", "<leader>fgc", ":Telescope git_commits<CR>", "Show Git Commits")
map("n", "<leader>fgs", ":Telescope git_status<CR>", "Show Git Status")
map("n", "<leader>flr", ":Telescope lsp_references<CR>", "Show LSP References")
map("n", "<leader>fls", ":Telescope lsp_document_symbols<CR>", "Show LSP Symbols")
map("n", "<leader>fn", ":Telescope notify<CR>", "Show Notifications")
map("n", "<leader>ft", ":TodoTelescope<CR>", "Show TODOs")
map("n", "<leader>fi", ":Telescope import<CR>", "Show Imports")
map("n", "<leader>rf", function()
  require("telescope").extensions.refactoring.refactors()
end, "Show Refactors")

-- LSP
map("n", "<leader>ld", vim.diagnostic.setloclist, "LSP List Diagnostics")
map("n", "[d", vim.diagnostic.goto_prev, "LSP Previous Diagnostic")
map("n", "]d", vim.diagnostic.goto_next, "LSP Next Diagnostic")
-- map("n", "<leader>lca", vim.lsp.buf.code_action, "LSP Code Actions")
map("n", "<leader>lca", function()
  require("actions-preview").code_actions()
end, "LSP Code Actions With Preview")
map("n", "<leader>lr", vim.lsp.buf.rename, "LSP Rename")

-- Conform
map("n", "<leader>fm", function()
  require("conform").format({ async = true })
end, "Format Buffer")

-- Outline
map("n", "<leader>ot", ":Outline<CR>", "Toggle Outline")
map("n", "<leader>of", ":OutlineFocus<CR>", "Toggle Outline")

-- Markdown
map("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", "Toggle Markdown Preview")
map("n", "<leader>mr", ":Markview toggle<CR>", "Toggle Markdown Rendering")

-- Gitsigns
map("n", "<leader>ghp", ":Gitsigns preview_hunk<CR>", "Preview Hunk")
map("n", "<leader>glb", ":Gitsigns toggle_current_line_blame<CR>", "Toggle Current Line Git Blame")
map("n", "<leader>gb", function()
  require("gitsigns").blame_line({ full = true })
end, "Show Git Blame")

-- Fugitive
map("n", "<leader>gac", ":Gwrite<CR>", "Git Add Current File")

-- Diffview
map("n", "<leader>gdo", ":DiffviewOpen<CR>", "Open Diffview")
map("n", "<leader>gdc", ":DiffviewClose<CR>", "Close Diffview")

-- AICommit
map("n", "<leader>ac", ":AICommit<CR>", "Generate Commit Message for Staged Files")

-- mini.diff
map("n", "<leader>gmd", function()
  require("mini.diff").toggle_overlay()
end, "Toggle mini.diff Overlay")

-- Compiler
map("n", "<leader>co", ":CompilerOpen<CR>", "Open Compiler Menu")
map("n", "<leader>cr", ":CompilerRedo<CR>", "Re-run Compiler Last Selected Option")
map("n", "<leader>ct", ":CompilerToggleResults<CR>", "Toggle Compiler Results")

-- Toggle f-string
map("n", "<leader>tf", function()
  require("f-string-toggle").toggle_fstring()
end, "Toggle f-string")

-- Biscuits
map("n", "<leader>bt", function()
  require("nvim-biscuits").toggle_biscuits()
end, "Toggle Biscuits")

-- Trouble
map("n", "<leader>td", ":Trouble diagnostics toggle<CR>", "Toggle Diagnostics")
map("n", "<leader>tbd", ":Trouble diagnostics toggle filter.buf=0<CR>", "Toggle Buffer Diagnostics")

-- TODO Comments
map("n", "]t", function()
  require("todo-comments").jump_next()
end, "Next TODO Comment")
map("n", "[t", function()
  require("todo-comments").jump_prev()
end, "Previous TODO Comment")

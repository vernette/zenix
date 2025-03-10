local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
map("n", "<leader>e", ":NvimTreeFocus<CR>", { desc = "Focus NvimTree" })

-- Oil
map("n", "-", ":Oil --float<CR>", { desc = "Open Current Directory in Oil" })

-- ToggleTerm
map("n", "<C-\\>", ":ToggleTerm<CR>", { desc = "Toggle Terminal" })
map("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit Terminal Mode" })

-- Flash
map({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })

-- BufDelete
map("n", "<A-w>", function() require("bufdelete").bufdelete(0, true) end, { desc = "Delete Current Buffer" })

-- IncRename
map("n", "<leader>ir", ":IncRename ", { desc = "Incremental Rename" })

-- Telescope
map("n", "<leader>th", ":Telescope colorscheme<CR>", { desc = "Choose Colorscheme" })
map("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find Files" })
map("n", "<leader>fw", ":Telescope live_grep<CR>", { desc = "Live Grep" })
map("n", "<leader>fo", ":Telescope oldfiles<CR>", { desc = "Show Recent Files" })
map("n", "<leader>fb", ":Telescope buffers<CR>", {desc = "Show Buffers"})
map("n", "<leader>fcb", ":Telescope current_buffer_fuzzy_find<CR>", {desc = "Search in Current Buffer"})
map("n", "<leader>fn", ":Telescope notify<CR>", {desc = "Show Notifications"})
map("n", "<leader>ft", ":TodoTelescope<CR>", {desc = "Show TODOs"})
map("n", "<leader>fi", ":Telescope import<CR>", {desc = "Show Imports"})

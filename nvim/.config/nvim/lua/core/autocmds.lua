local autocmd = vim.api.nvim_create_autocmd

-- Dynamic terminal padding for kitty, you can apply the same logic for other terminals
autocmd("VimEnter", {
  command = ":silent !kitty @ set-spacing padding=0",
})

autocmd("VimLeavePre", {
  command = ":silent !kitty @ set-spacing padding=10",
})

-- Ensure virtual text is disabled even if overridden by plugins
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.diagnostic.config({ virtual_text = false })
  end,
})

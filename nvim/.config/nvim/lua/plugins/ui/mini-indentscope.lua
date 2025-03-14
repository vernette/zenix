return {
  "echasnovski/mini.indentscope",
  version = false,
  event = "VeryLazy",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Disable indentscope for certain filetypes",
      pattern = {
        "help",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "NvimTree",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
}

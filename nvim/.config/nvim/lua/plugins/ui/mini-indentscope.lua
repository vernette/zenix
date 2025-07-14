return {
  "echasnovski/mini.indentscope",
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Disable indentscope for certain filetypes",
      pattern = {
        "help",
        "lazy",
        "mason",
        "notify",
        "toggleterm",
        "neo-tree",
      },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
  end,
  opts = {},
}

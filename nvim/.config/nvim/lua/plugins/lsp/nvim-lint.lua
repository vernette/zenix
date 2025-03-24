return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lint = require("lint")
    local opts = require("configs.nvim-lint")

    lint.linters_by_ft = opts.linters_by_ft

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged", "TextChangedI" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}

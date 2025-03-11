return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local lsp_settings = require("configs.lspconfig")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

    for server_name, server_settings in pairs(lsp_settings.servers) do
      local final_settings = vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          lsp_settings.default_config(client, bufnr)
        end,
      }, server_settings or {})

      lspconfig[server_name].setup(final_settings)
    end

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
    })
  end,
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local lspconfig = require("lspconfig")
    local lsp_settings = require("configs.lspconfig")

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

    for server_name, server_settings in pairs(lsp_settings.servers) do
      local final_settings = vim.tbl_deep_extend("force", {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          lsp_settings.default_config(client, bufnr)
        end,
      }, server_settings or {})

      lspconfig[server_name].setup(final_settings)
    end

    local signs = {
      Error = " ",
      Warn = " ",
      Hint = "󰌵 ",
      Info = " ",
    }

    local signConf = {
      text = {},
      texthl = {},
      numhl = {},
    }

    for type, icon in pairs(signs) do
      local severityName = string.upper(type)
      local severity = vim.diagnostic.severity[severityName]
      local hl = "DiagnosticSign" .. type
      signConf.text[severity] = icon
      signConf.texthl[severity] = hl
      signConf.numhl[severity] = hl
    end

    vim.diagnostic.config({
      virtual_text = true,
      signs = signConf,
      underline = true,
      update_in_insert = true,
      severity_sort = true,
    })
  end,
}

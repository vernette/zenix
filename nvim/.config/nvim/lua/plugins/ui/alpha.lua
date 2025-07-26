return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VimEnter",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    -- TODO: Move config to configs folder
    local logo = [[
 ███████╗███████╗███╗   ██╗██╗   ██╗██╗███╗   ███╗
 ╚══███╔╝██╔════╝████╗  ██║██║   ██║██║████╗ ████║
   ███╔╝ █████╗  ██╔██╗ ██║██║   ██║██║██╔████╔██║
  ███╔╝  ██╔══╝  ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
 ███████╗███████╗██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚══════╝╚══════╝╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
    ]]
    dashboard.section.header.val = vim.split(logo, "\n")
    dashboard.section.buttons.val = {
      dashboard.button("SPC ff", " " .. " Find Files", ":Telescope find_files<CR>"),
      dashboard.button("SPC fo", " " .. " Recent Files", ":Telescope oldfiles<CR>"),
      dashboard.button("SPC fw", "󰈬 " .. " Find Text", ":Telescope live_grep<CR>"),
      dashboard.button("SPC ft", " " .. " Find TODOs", ":TodoTelescope<CR>"),
      dashboard.button("e", " " .. " New File", ":ene <BAR> startinsert<CR>"),
      dashboard.button("q", " " .. " Quit Neovim", ":qa<CR>"),
    }
    for _, button in ipairs(dashboard.section.buttons.val) do
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
    end
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButtons"
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.opts.layout[1].val = 8
    return dashboard
  end,
  config = function(_, dashboard)
    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "AlphaReady",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    require("alpha").setup(dashboard.opts)

    vim.api.nvim_create_autocmd("User", {
      callback = function()
        local stats = require("lazy").stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local v = vim.version()
        local version_str = string.format("%d.%d.%d", v.major, v.minor, v.patch)
        dashboard.section.footer.val = "⚡ Neovim " .. version_str .. " loaded "
          .. stats.loaded
          .. "/"
          .. stats.count
          .. " plugins in "
          .. ms
          .. "ms"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}

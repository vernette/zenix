local signs = {
  add = { text = "+" },
  change = { text = "~" },
  delete = { text = "_" },
  topdelete = { text = "‾" },
  changedelete = { text = "~" },
}

return {
  signs = signs,
  signs_staged = signs,
  current_line_blame_formatter = "[<author_time:%R>] <author>: <summary>",
}

local function pad_numbers(str)
  return string.gsub(str, "%d+", function(n)
    return string.format("%010d", tonumber(n))
  end)
end

return {
  close_if_last_window = true,

  window = {
    position = "right",
    width = 45,
    auto_expand_width = true,
  },

  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 0,
    },
  },

  filesystem = {
    filtered_items = {
      visible = true,
      hide_dotfiles = true,
      hide_gitignored = true,
    },
  },

  sort_function = function(a, b)
    if not a or not b then
      return false
    end

    local a_name = a.name or (a.path and vim.fn.fnamemodify(a.path, ":t")) or ""
    local b_name = b.name or (b.path and vim.fn.fnamemodify(b.path, ":t")) or ""

    local a_type = a.type or "file"
    local b_type = b.type or "file"

    if a_type ~= b_type then
      return a_type == "directory"
    end

    return pad_numbers(a_name:lower()) < pad_numbers(b_name:lower())
  end,

  source_selector = {
    winbar = true,

    sources = {
      { source = "filesystem" },
      { source = "git_status" },
    },
  },
}

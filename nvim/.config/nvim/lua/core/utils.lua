local M = {}

function M.get_pyproject_path()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir = vim.fn.fnamemodify(current_file, ":p:h")

  local found = vim.fs.find("pyproject.toml", {
    path = current_dir,
    upward = true,
    type = "file",
  })

  return found[1] -- nil or full path
end

return M

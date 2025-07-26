local M = {}

local function find_git_root(start_path)
  local escaped_path = vim.fn.fnameescape(start_path)
  local result = vim.fn.systemlist("git -C " .. escaped_path .. " rev-parse --show-toplevel")

  if vim.v.shell_error == 0 and #result > 0 then
    return result[1]
  end

  return nil
end

function M.get_pyproject_path()
  local current_file = vim.api.nvim_buf_get_name(0)
  local current_dir = vim.fn.fnamemodify(current_file, ":p:h")
  local git_root = find_git_root(current_dir)

  if not git_root then
    return nil
  end

  local pyproject_path = git_root .. "/pyproject.toml"
  if vim.fn.filereadable(pyproject_path) == 1 then
    return pyproject_path
  end

  return nil
end

return M

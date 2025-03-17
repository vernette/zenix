local close_pattern = "[^\\]."
local open_pattern = ".[%s%z%)}%]]"
local close_open_pattern = "[^%w\\][^%w]"

local function create_mapping(action, pair, neigh_pattern, register)
  return {
    action = action,
    pair = pair,
    neigh_pattern = neigh_pattern,
    register = register,
  }
end

return {
  mappings = {
    [")"] = create_mapping("close", "()", close_pattern),
    ["]"] = create_mapping("close", "[]", close_pattern),
    ["}"] = create_mapping("close", "{}", close_pattern),
    ["["] = create_mapping("open", "[]", open_pattern, { cr = false }),
    ["{"] = create_mapping("open", "{}", open_pattern, { cr = false }),
    ["("] = create_mapping("open", "()", open_pattern, { cr = false }),
    ['"'] = create_mapping("closeopen", '""', close_open_pattern, { cr = false }),
    ["'"] = create_mapping("closeopen", "''", close_open_pattern, { cr = false }),
    ["`"] = create_mapping("closeopen", "``", close_open_pattern, { cr = false }),
  },
}

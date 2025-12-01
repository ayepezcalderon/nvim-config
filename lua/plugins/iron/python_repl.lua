local M = {}

-- candidate commands in priority order
local candidates = {
  { "uv",      "run",            "ipython", "--no-autoindent" },
  { "uv",      "run",            "python3" },
  { "ipython", "--no-autoindent" },
  { "python3" },
}

local cache = nil -- store the resolved command

-- main function: returns cached command if available
function M.get()
  if cache then
    return cache
  end

  for _, cmd in ipairs(candidates) do
    local candidate_copy = vim.deepcopy(cmd)
    table.insert(candidate_copy, "--version")
    vim.fn.system(candidate_copy)
    if vim.v.shell_error == 0 then
      cache = cmd
      return cache
    end
  end

  return error("No suitable Python REPL found.")
end

return M

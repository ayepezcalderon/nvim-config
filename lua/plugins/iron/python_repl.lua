local M = {}

local cache = {
  resolved = nil,
  pending = false,
  queue = {}, -- functions to run once resolved
}

local candidates = {
  { "ipython", "--no-autoindent" },
  { "ipython" },
  { "python" },
}

-- helper: create uv run command
local function uv_run_cmd(cmd)
  return vim.list_extend({ "uv", "run" }, vim.deepcopy(cmd))
end

-- probe uv run asynchronously
local function uv_run_available(cmd, callback)
  if vim.fn.executable("uv") ~= 1 then
    return callback(false)
  end
  local subcmd = table.concat(cmd, " ")
  vim.fn.jobstart("uv run " .. subcmd .. " --version", {
    on_exit = function(_, code)
      callback(code == 0)
    end,
    stdout_buffered = true,
    stderr_buffered = true,
  })
end

-- resolve recursively
local function resolve_async()
  cache.pending = true
  local i = 1

  local function try_next()
    if i > #candidates then
      -- fallback to global
      for _, cmd in ipairs(candidates) do
        if vim.fn.executable(cmd[1]) == 1 then
          cache.resolved = cmd
          goto DONE
        end
      end
      if vim.fn.executable("python3") == 1 then
        cache.resolved = { "python3" }
      else
        cache.resolved = nil
      end
      ::DONE::
      cache.pending = false
      -- run queued functions
      for _, fn in ipairs(cache.queue) do fn(cache.resolved) end
      cache.queue = {}
      return
    end

    local cmd = candidates[i]
    i = i + 1

    uv_run_available(cmd, function(ok)
      if ok then
        cache.resolved = uv_run_cmd(cmd)
        cache.pending = false
        for _, fn in ipairs(cache.queue) do fn(cache.resolved) end
        cache.queue = {}
      else
        try_next()
      end
    end)
  end

  try_next()
end

-- public get() function
-- fn: optional callback to call once resolved
function M.get(fn)
  if cache.resolved then
    if fn then fn(cache.resolved) end
    return cache.resolved
  end

  if fn then
    table.insert(cache.queue, fn)
  end

  if not cache.pending then
    resolve_async()
  end

  -- return temporary fallback to avoid Iron:E5108
  if vim.fn.executable("python3") == 1 then
    return { "python3" }
  else
    return { "python" }
  end
end

return M

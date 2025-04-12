local utils = require('utils.lsp')

local function reload_workspace(bufnr)
  bufnr = utils.validate_bufnr(bufnr)
  local clients = vim.lsp.get_clients { bufnr = bufnr, name = 'rust_analyzer' }
  for _, client in ipairs(clients) do
    vim.notify 'Reloading Cargo Workspace'
    client.request('rust-analyzer/reloadWorkspace', nil, function(err)
      if err then
        error(tostring(err))
      end
      vim.notify 'Cargo workspace reloaded'
    end, 0)
  end
end

local function is_library(fname)
  local user_home = vim.fs.normalize(vim.env.HOME)
  local cargo_home = os.getenv 'CARGO_HOME' or user_home .. '/.cargo'
  local registry = cargo_home .. '/registry/src'
  local git_registry = cargo_home .. '/git/checkouts'

  local rustup_home = os.getenv 'RUSTUP_HOME' or user_home .. '/.rustup'
  local toolchains = rustup_home .. '/toolchains'

  for _, item in ipairs { toolchains, registry, git_registry } do
    if vim.fs.relpath(item, fname) then
      local clients = vim.lsp.get_clients { name = 'rust_analyzer' }
      return #clients > 0 and clients[#clients].config.root_dir or nil
    end
  end
end

return {
  cmd = { 'rust-analyzer' },
  filetypes = utils.get_filetypes('rust_analyzer'),
  single_file_support = true,

  root_dir = function(bufnr, cb)
    local fname = vim.api.nvim_buf_get_name(bufnr)

    local reuse_active = is_library(fname)
    if reuse_active then
      cb(reuse_active)
      return
    end

    local cargo_crate_dir = utils.root_pattern 'Cargo.toml' (fname)

    if cargo_crate_dir ~= nil then
      local cmd = {
        'cargo',
        'metadata',
        '--no-deps',
        '--format-version',
        '1',
        '--manifest-path',
        cargo_crate_dir .. '/Cargo.toml',
      }

      local stdout = {}
      local stderr = {}
      local exit_code = nil

      local jobid = vim.fn.jobstart(cmd, {
        on_stdout = function(_, data, _)
          data = table.concat(data, '\n')
          if #data > 0 then
            stdout[#stdout + 1] = data
          end
        end,
        on_stderr = function(_, data, _)
          stderr[#stderr + 1] = table.concat(data, '\n')
        end,
        on_exit = function(_, code, _)
          exit_code = code

          local result
          if exit_code ~= 0 then
            vim.notify(
              ('lsp cmd failed with code %d: %s\n%s'):format(exit_code, cmd, table.concat(stderr, '')),
              vim.log.levels.WARN
            )
            result = nil
          elseif next(stdout) == nil then
            result = nil
          else
            result = stdout and stdout or nil
          end

          local cargo_workspace_root
          if result and result[1] then
            result = vim.json.decode(table.concat(result, ''))
            if result['workspace_root'] then
              cargo_workspace_root = vim.fs.normalize(result['workspace_root'])
            end
          end
          vim.schedule(function()
            cb(cargo_workspace_root or cargo_crate_dir)
          end)
        end,
        stdout_buffered = true,
        stderr_buffered = true,
      })

      if jobid <= 0 then
        -- Fallback if the job failed
        vim.notify(('lsp unable to run cmd: %s'):format(cmd), vim.log.levels.WARN)
        vim.schedule(function() cb(cargo_crate_dir) end)
      end

      return
    end

    -- Fallback if no Cargo.toml found
    cb(utils.root_pattern 'rust-project.json' (fname)
      or vim.fs.dirname(vim.fs.find('.git', { path = fname, upward = true })[1]))
  end,

  capabilities = vim.tbl_deep_extend("force", utils.capabilities, {
    experimental = {
      serverStatusNotification = true,
    },
  }),

  before_init = function(init_params, config)
    -- See https://github.com/rust-lang/rust-analyzer/blob/eb5da56d839ae0a9e9f50774fa3eb78eb0964550/docs/dev/lsp-extensions.md?plain=1#L26
    if config.settings and config.settings['rust-analyzer'] then
      init_params.initializationOptions = config.settings['rust-analyzer']
    end
  end,

  on_attach = function(client, bufnr)
    utils.on_attach(client, bufnr)
    -- User commands
    vim.api.nvim_buf_create_user_command(bufnr, 'CargoReload', function()
      reload_workspace(bufnr)
    end, {
      desc = 'Reload current cargo workspace',
    })
  end,
}

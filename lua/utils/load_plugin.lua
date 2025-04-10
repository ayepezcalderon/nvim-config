local M = {}

--- Add keymaps to current buffer to easily close it with q and <ESC> in normal mode
function M.set_buf_easy_close_mappings()
  vim.keymap.set("n", "q", "<cmd>:q<CR>", { buffer = 0 })
  vim.keymap.set("n", "<ESC>", "<cmd>:q<CR>", { buffer = 0 })
end

--- Taken from nvchad
--- Creates autocommand for lazy loading plugin on any sort of file opening, except on a few excluded file types.
M.lazy_load = function(plugin)
  vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("BeLazyOnFileOpen" .. plugin, {}),
    callback = function()
      local file = vim.fn.expand("%")
      local condition = file ~= "NvimTree_1" and file ~= "[lazy]" and file ~= ""

      if condition then
        vim.api.nvim_del_augroup_by_name("BeLazyOnFileOpen" .. plugin)

        -- dont defer for treesitter as it will show slow highlighting
        -- This deferring only happens only when we do "nvim filename"
        if plugin ~= "nvim-treesitter" then
          vim.schedule(function()
            require("lazy").load({ plugins = plugin })

            if plugin == "nvim-lspconfig" then
              vim.cmd("silent! do FileType")
            end
          end)
        else
          require("lazy").load({ plugins = plugin })
        end
      end
    end,
  })
end

--- Function to assign to init field of lazy spec for plugins that should only load for git repos.
---@param plugin string Name of plugin.
---@param augroup string Name of augroup created during this process.
M.init_git_plugin = function(plugin, augroup)
  -- load gitsigns only when a git file is opened
  vim.api.nvim_create_autocmd({ "BufRead" }, {
    group = vim.api.nvim_create_augroup(augroup, { clear = true }),
    callback = function()
      vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
      if vim.v.shell_error == 0 then
        vim.api.nvim_del_augroup_by_name(augroup)
        vim.schedule(function()
          require("lazy").load({ plugins = { plugin } })
        end)
      end
    end,
  })
end

return M

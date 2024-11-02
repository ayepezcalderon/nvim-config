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
          end, 0)
        else
          require("lazy").load({ plugins = plugin })
        end
      end
    end,
  })
end

return M

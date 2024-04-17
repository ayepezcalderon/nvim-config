------------ OPTS -----------
local _opts = {
  ensure_installed = {
    "pyright",
    "debugpy",
    "black",
    "yapf",
    "ruff",
    "texlab",
    "latexindent",
    "lua-language-server",
  },

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

------------ CONFIG -----------
local _config = function(_, opts)
  require("mason").setup(opts)

  -- cmd to install all mason binaries listed, taken from nvchad
  vim.api.nvim_create_user_command("MasonInstallAll", function()
    vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
  end, {})

  -- vim.g.mason_binaries_list = opts.ensure_installed
end

------------ RETURN -----------
return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
  commit = "41e75af1f578e55ba050c863587cffde3556ffa6",
  opts = _opts,
  config = _config,
}

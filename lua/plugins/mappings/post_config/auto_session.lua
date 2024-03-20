local map = vim.keymap.set

map(
  {"n"},
  "<leader>fs",
  function ()
    require("auto-session.session-lens").search_session()
  end,
  {desc="Find session"}
)
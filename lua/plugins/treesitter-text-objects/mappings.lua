local M = {}

------------- OPTS -------------
M.textobjects = {
  select = {
    enable = true,

    -- Automatically jump forward to textobj, similar to targets.vim
    lookahead = true,

    keymaps = {
      -- You can use the capture groups defined in textobjects.scm
      ["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
      ["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
      ["L="] = { query = "@assignment.lhs", desc = "Select left hand side of an assignment" },
      ["r="] = { query = "@assignment.rhs", desc = "Select right hand side of an assignment" },

      ["aa"] = { query = "@parameter.outer", desc = "Select outer part of a parameter/argument" },
      ["ia"] = { query = "@parameter.inner", desc = "Select inner part of a parameter/argument" },

      ["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
      ["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },

      ["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
      ["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

      ["af"] = { query = "@call.outer", desc = "Select outer part of a function call" },
      ["if"] = { query = "@call.inner", desc = "Select inner part of a function call" },

      ["am"] = { query = "@function.outer", desc = "Select outer part of a method/function definition" },
      ["im"] = { query = "@function.inner", desc = "Select inner part of a method/function definition" },

      ["ab"] = { query = "@class.outer", desc = "Select outer part of a class" },
      ["ib"] = { query = "@class.inner", desc = "Select inner part of a class" },
    },
  },
  swap = {
    enable = true,
    swap_next = {
      ["<leader>na"] = "@parameter.inner", -- swap parameters/argument with next
      ["<leader>nm"] = "@function.outer", -- swap function with next
    },
    swap_previous = {
      ["<leader>pa"] = "@parameter.inner", -- swap parameters/argument with prev
      ["<leader>pm"] = "@function.outer", -- swap function with previous
    },
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]a"] = { query = "@parameter.outer", desc = "Next parameter/argument start" },
      ["]="] = { query = "@assignment.outer", desc = "Next assignment start" },
      ["]f"] = { query = "@call.outer", desc = "Next function call start" },
      ["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
      ["]b"] = { query = "@class.outer", desc = "Next class start" },
      ["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
      ["]l"] = { query = "@loop.outer", desc = "Next loop start" },
    },
    goto_next_end = {
      ["]A"] = { query = "@parameter.outer", desc = "Next parameter/argument end" },
      ["]F"] = { query = "@call.outer", desc = "Next function call end" },
      ["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
      ["]B"] = { query = "@class.outer", desc = "Next class end" },
      ["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
      ["]L"] = { query = "@loop.outer", desc = "Next loop end" },
    },
    goto_previous_start = {
      ["[a"] = { query = "@parameter.outer", desc = "Prev parameter/argument call start" },
      ["[="] = { query = "@assignment.outer", desc = "Prev assignment start" },
      ["[f"] = { query = "@call.outer", desc = "Prev function call start" },
      ["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
      ["[b"] = { query = "@class.outer", desc = "Prev class start" },
      ["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
      ["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
    },
    goto_previous_end = {
      ["[A"] = { query = "@parameter.outer", desc = "Prev parameter/argument call end" },
      ["[F"] = { query = "@call.outer", desc = "Prev function call end" },
      ["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
      ["[B"] = { query = "@class.outer", desc = "Prev class end" },
      ["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
      ["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
    },
  },
}

------------- OPTS -------------
function M.repeatable_move()
  -- , and ; support for movements
  local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")

  -- vim way: ; goes to the direction you were moving.
  vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
  vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

  -- Optionally, make builtin f, F, t, T also repeatable with ; and ,
  vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f)
  vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F)
  vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t)
  vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T)
end

return M

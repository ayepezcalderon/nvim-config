local map = vim.keymap.set

local nvto_select = require("nvim-treesitter-textobjects.select")
local nvto_swap = require("nvim-treesitter-textobjects.swap")
local nvto_move = require("nvim-treesitter-textobjects.move")


map({ "x", "o" }, "a=", function()
  nvto_select.select_textobject("@assignment.outer")
end, { desc = "Select outer part of an assignment" })
map({ "x", "o" }, "i=",
  function()
    nvto_select.select_textobject("@assignment.inner")
  end, { desc = "Select inner part of an assignment" })

map({ "x", "o" }, "L=", function()
  nvto_select.select_textobject("@assignment.lhs")
end, { desc = "Select left hand side of an assignment" })

map({ "x", "o" }, "r=", function()
  nvto_select.select_textobject("@assignment.rhs")
end, { desc = "Select right hand side of an assignment" })

map({ "x", "o" }, "aa", function()
  nvto_select.select_textobject("@parameter.outer")
end, { desc = "Select outer part of a parameter/argument" })

map({ "x", "o" }, "ia", function()
  nvto_select.select_textobject("@parameter.inner")
end, { desc = "Select inner part of a parameter/argument" })

map({ "x", "o" }, "ai", function()
  nvto_select.select_textobject("@conditional.outer")
end, { desc = "Select outer part of a conditional" })

map({ "x", "o" }, "ii", function()
  nvto_select.select_textobject("@conditional.inner")
end, { desc = "Select inner part of a conditional" })

map({ "x", "o" }, "al", function()
  nvto_select.select_textobject("@loop.outer")
end, { desc = "Select outer part of a loop" })

map({ "x", "o" }, "il", function()
  nvto_select.select_textobject("@loop.inner")
end, { desc = "Select inner part of a loop" })

map({ "x", "o" }, "af", function()
  nvto_select.select_textobject("@call.outer")
end, { desc = "Select outer part of a function call" })

map({ "x", "o" }, "if", function()
  nvto_select.select_textobject("@call.inner")
end, { desc = "Select inner part of a function call" })

map({ "x", "o" }, "am", function()
  nvto_select.select_textobject("@function.outer")
end, { desc = "Select outer part of a method/function definition" })

map({ "x", "o" }, "im", function()
  nvto_select.select_textobject("@function.inner")
end, { desc = "Select inner part of a method/function definition" })

map({ "x", "o" }, "ab", function()
  nvto_select.select_textobject("@class.outer")
end, { desc = "Select outer part of a class" })

map({ "x", "o" }, "ib", function()
  nvto_select.select_textobject("@class.inner")
end, { desc = "Select inner part of a class" })

map("n", "<leader>na", function()
  nvto_swap.swap_next("@parameter.inner")
end, { desc = "Swap with next @parameter.inner" })

map("n", "<leader>nm", function()
  nvto_swap.swap_next("@function.outer")
end, { desc = "Swap with next @function.outer" })

map("n", "<leader>pa", function()
  nvto_swap.swap_previous("@parameter.inner")
end, { desc = "Swap with previous @parameter.inner" })

map("n", "<leader>pm", function()
  nvto_swap.swap_previous("@function.outer")
end, { desc = "Swap with previous @function.outer" })

map({ "n", "x", "o" }, "]a",
  function()
    nvto_move.goto_next_start("@parameter.outer")
  end, { desc = "Next parameter/argument start" })

map({ "n", "x", "o" }, "]=", function()
  nvto_move.goto_next_start("@assignment.outer")
end, { desc = "Next assignment start" })

map({ "n", "x", "o" }, "]f", function()
  nvto_move.goto_next_start("@call.outer")
end, { desc = "Next function call start" })

map({ "n", "x", "o" }, "]m", function()
  nvto_move.goto_next_start("@function.outer")
end, { desc = "Next method/function def start" })

map({ "n", "x", "o" }, "]b", function()
  nvto_move.goto_next_start("@class.outer")
end, { desc = "Next class start" })

map({ "n", "x", "o" }, "]i", function()
  nvto_move.goto_next_start("@conditional.outer")
end, { desc = "Next conditional start" })

map({ "n", "x", "o" }, "]l", function()
  nvto_move.goto_next_start("@loop.outer")
end, { desc = "Next loop start" })

map({ "n", "x", "o" }, "]A", function()
  nvto_move.goto_next_end("@parameter.outer")
end, { desc = "Next parameter/argument end" })

map({ "n", "x", "o" }, "]F", function()
  nvto_move.goto_next_end("@call.outer")
end, { desc = "Next function call end" })

map({ "n", "x", "o" }, "]M", function()
  nvto_move.goto_next_end("@function.outer")
end, { desc = "Next method/function def end" })

map({ "n", "x", "o" }, "]B", function()
  nvto_move.goto_next_end("@class.outer")
end, { desc = "Next class end" })

map({ "n", "x", "o" }, "]I", function()
  nvto_move.goto_next_end("@conditional.outer")
end, { desc = "Next conditional end" })

map({ "n", "x", "o" }, "]L", function()
  nvto_move.goto_next_end("@loop.outer")
end, { desc = "Next loop end" })

map({ "n", "x", "o" }, "[a", function()
  nvto_move.goto_previous_start("@parameter.outer")
end, { desc = "Prev parameter/argument call start" })

map({ "n", "x", "o" }, "[=", function()
  nvto_move.goto_previous_start("@assignment.outer")
end, { desc = "Prev assignment start" })

map({ "n", "x", "o" }, "[f", function()
  nvto_move.goto_previous_start("@call.outer")
end, { desc = "Prev function call start" })

map({ "n", "x", "o" }, "[m", function()
  nvto_move.goto_previous_start("@function.outer")
end, { desc = "Prev method/function def start" })

map({ "n", "x", "o" }, "[b", function()
  nvto_move.goto_previous_start("@class.outer")
end, { desc = "Prev class start" })

map({ "n", "x", "o" }, "[i", function()
  nvto_move.goto_previous_start("@conditional.outer")
end, { desc = "Prev conditional start" })

map({ "n", "x", "o" }, "[l", function()
  nvto_move.goto_previous_start("@loop.outer")
end, { desc = "Prev loop start" })

map({ "n", "x", "o" }, "[A", function()
  nvto_move.goto_previous_end("@parameter.outer")
end, { desc = "Prev parameter/argument call end" })

map({ "n", "x", "o" }, "[F", function()
  nvto_move.goto_previous_end("@call.outer")
end, { desc = "Prev function call end" })

map({ "n", "x", "o" }, "[M", function()
  nvto_move.goto_previous_end("@function.outer")
end, { desc = "Prev method/function def end" })

map({ "n", "x", "o" }, "[B", function()
  nvto_move.goto_previous_end("@class.outer")
end, { desc = "Prev class end" })

map({ "n", "x", "o" }, "[I", function()
  nvto_move.goto_previous_end("@conditional.outer")
end, { desc = "Prev conditional end" })

map({ "n", "x", "o" }, "[L", function()
  nvto_move.goto_previous_end("@loop.outer")
end, { desc = "Prev loop end" })

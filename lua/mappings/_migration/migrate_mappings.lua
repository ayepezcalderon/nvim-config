vim = require("_vim")

local CORE_LEGACY_MAPS = require("core_mappings")
local CUSTOM_LEGACY_MAPS = require("custom_mappings")
local LEGACY_MAPS = vim.tbl_deep_extend("force", CORE_LEGACY_MAPS, CUSTOM_LEGACY_MAPS)

local S = "local map = vim.keymap.set\n\n"
for p_name, p_table in pairs(LEGACY_MAPS) do
  S = S .. '------- ' .. string.upper(p_name) .. ' -------' .. '\n'
  for modes, modes_content in pairs(p_table) do
    if modes ~= "plugin" then
      for lhs, keymap in pairs(modes_content) do
        if type(keymap[1]) == "function" then
          keymap[1] = debug.getinfo(keymap[1])["linedefined"]
        else
          local quote = "'"
          if string.find(keymap[1], quote) ~= nil then
            quote = '"'
          end
          keymap[1] = quote .. keymap[1] .. quote
        end
        S = S .. string.format('map(\n  {"%s"},\n  "%s",\n  %s,\n  {desc="%s"}\n)\n', modes, lhs, keymap[1], keymap[2])
      end
    end
  end
  S = S .. '\n'
end

print(S)

local file = io.open("new_mappings.lua", "w")
if file then
  file:write(S)
  file:close()
  print("Successfully written to file!")
else
  print("ERROR: Could not write to file")
end

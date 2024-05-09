-- "gamemodes\\halorp\\plugins\\combat\\sh_plugin.lua"

-- Retrieved by https://github.com/c4fe/glua-steal

local PLUGIN = PLUGIN

PLUGIN.name = "Actor Entities / Nut_Combat"

PLUGIN.author = "nutscript tard, gutted by filter & vented/caramel"

PLUGIN.desc = "A shitass entity actor that can look like a character."



PLUGIN.savedEnts = PLUGIN.savedEnts or {}



local playerMeta = FindMetaTable("Player")



Schema.name = "Fallout: New Vegas"
Schema.author = "Scrat Knapp"
Schema.description = "A tabletop inspired Fallout Roleplay."

-- Include netstream
ix.util.Include("libs/thirdparty/sh_netstream2.lua")

ix.util.Include("sh_configs.lua")
ix.util.Include("sh_commands.lua")

ix.util.Include("cl_schema.lua")
ix.util.Include("cl_hooks.lua")
ix.util.Include("sh_hooks.lua")
ix.util.Include("sv_schema.lua")
ix.util.Include("sv_hooks.lua")

ix.util.Include("meta/sh_player.lua")
ix.util.Include("meta/sv_player.lua")
ix.util.Include("meta/sh_character.lua")

ix.flag.Add("N", "Event/Customization")

ix.anim.SetModelClass("models/sanctum/ncr_powerarmor.mdl", "player")
ix.anim.SetModelClass("models/sanctum/raider/raidert45helm6.mdl", "player")


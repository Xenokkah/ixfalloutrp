local PLUGIN = PLUGIN


PLUGIN.name = "Fallout: New Vegas HUD Extras"
PLUGIN.description = "Adds a Fallout: New Vegas stuff for my HUD."
PLUGIN.author = "_HappyGoLucky"

ix.util.Include("sh_hooks.lua")
ix.util.Include("sv_hooks.lua")


--Oxygen Stuff
ix.config.Add("oxygenDrain", 3, "The amount of oxygen drained (out of 100) per second.", nil, {
    data = {min = 0, max = 100},
    category = "fonvOxygenConfig"
})

ix.config.Add("oxygenRegain", 10, "The amount of oxygen regained (out of 100) per second.", nil, {
    data = {min = 0, max = 100},
    category = "fonvOxygenConfig"
})

ix.config.Add("drowningDamage", 10, "The amount of damage you take for drowning per second.", nil, {
    data = {min = 0, max = 100},
    category = "fonvOxygenConfig"
})

--Weapon Condition Stuff
ix.config.Add("weaponConditionDrainRate", 0.05, "The amount a weapon will drain (pre-modifiers) per shot.", nil, {
    data = {min = 0.0, max = 1.0, decimals = 2},
    category = "fonvWeaponConditionConfig"
})

ix.config.Add("bulletDamageBasedOnWeaponCondition", true, "Modify the bullets damage based on the condition of your gun.", nil, {
    category = "fonvWeaponConditionConfig"
})



    
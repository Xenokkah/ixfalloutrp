PLUGIN.name = 'Player Stats'
PLUGIN.author = 'Scrat Knapp'
PLUGIN.description = "Adds stats and commands for manging player health, armor, and AP tabletop style."

local characterMeta = FindMetaTable("Character")
-- Create vars for character HP, DT, DR, ET, and AP, with an extra var for each for temporary boosts to these things.

ix.char.RegisterVar("Charcurrenthp", {
    field = "charcurrenthp",
    fieldType = ix.type.number,
    default = 50,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Charmaxhp", {
    field = "charmaxhp",
    fieldType = ix.type.number,
    default = 50,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Charmaxhpboost", {
    field = "charmaxhpboost",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})
ix.char.RegisterVar("Chardt", {
    field = "chardt",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Chardtboost", {
    field = "chardtboost",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Chardr", {
    field = "chardr",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Chardrboost", {
    field = "chardrboost",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})


ix.char.RegisterVar("Charet", {
    field = "charet",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("charetboost", {
    field = "repair",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("charap", {
    field = "charap",
    fieldType = ix.type.number,
    default = 5,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("charapboost", {
    field = "medicine",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})


function characterMeta:GetTotalCharHp()
	return self:GetCharacter():GetCharmaxhp() + self:GetCharacter():GetCharmaxhpboost()
end

function characterMeta:GetTotalCharDt()
	return self:GetCharacter():GetChardt() + self:GetCharacter():GetChardtboost()
end

function characterMeta:GetTotalCharDr()
	return self:GetCharacter():GetChardr() + self:GetCharacter():GetChardrboost()
end

function characterMeta:GetTotalCharEt()
	return self:GetCharacter():GetCharet() + self:GetCharacter():GetCharetboost()
end

function characterMeta:GetTotalCharAp()
	return self:GetCharacter():GetCharap() + self:GetCharacter():GetCharapboost()
end



ix.command.Add("Status", {
	description = "View your current health, armor, and max AP.",
	OnRun = function(self, client)
		local str = ""
        local char = client:GetCharacter()
        
        str = str .. "Health: " .. char:GetCharcurrenthp() .. "/" .. char:GetTotalCharHp() .. "\n"
        return str
	end
})
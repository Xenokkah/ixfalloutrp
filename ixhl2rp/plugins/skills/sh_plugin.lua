local PLUGIN = PLUGIN
PLUGIN.name = "Skills"
PLUGIN.author = "Scrat Knapp"
PLUGIN.desc = "Define and upgrade skills."



ix.char.RegisterVar("SkillPoints", {
    field = "skillpoints",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

    --[[

ix.char.RegisterVar("EnergyWeapons", {
    field = "energyweapons",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Explosives", {
    field = "explosives",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Guns", {
    field = "guns",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Melee", {
    field = "melee",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Unarmed", {
    field = "unarmed",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})


ix.char.RegisterVar("survival", {
    field = "survival",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Repair", {
    field = "repair",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Science", {
    field = "science",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Medicine", {
    field = "medicine",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Lockpick", {
    field = "lockpick",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("Evasion", {
    field = "evasion",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})


ix.char.RegisterVar("Evasion", {
    field = "evasion",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

--]]



function PLUGIN:OnCharacterCreated(client, character)
    -- After char creation, get character's SPECIAL and assign skills based on these
    local strength = character:GetAttribute("strength")
    local perception = character:GetAttribute("perception")
    local endurance = character:GetAttribute("endurance")
    local charisma = character:GetAttribute("charisma")
    local intelligence = character:GetAttribute("intelligence")
    local agility = character:GetAttribute("agility")
    local luck = character:GetAttribute("luck")

    luckboost = math.ceil(luck / 2)

    character:SetSkill("meleeweapons", strength + luckboost)
    character:SetSkill("unarmed", strength + luckboost)

    character:SetSkill("energyweapons", perception + luckboost)
    character:SetSkill("explosives", perception + luckboost)
    character:SetSkill("lockpicking", perception + luckboost)

    character:SetSkill("survival", endurance + luckboost)

    character:SetSkill("science", intelligence + luckboost)
    character:SetSkill("repair", intelligence + luckboost)
    character:SetSkill("medicine", intelligence + luckboost)

    character:SetSkill("guns", agility + luckboost)
    character:SetSkill("evasion", agility + luckboost)

end 

ix.command.Add("MySkills", {
	description = "View your current skills.",
	OnRun = function(self, client)
		local str = ""
        local char = client:GetCharacter()
    
        if (char:GetSkillPoints() > 0) then
            str =  str .. "You have unspent skill points! /spendskillpoints to use.\n"
        end 
        str =  str .. "Energy Weapons: " .. char:GetAttribute("energyweapons", 0).. "/20\n"
        str = str .. "Guns: " ..char:GetAttribute("guns", 0).. "/20\n"
        str = str .. "Melee Weapons: " ..char:GetAttribute("meleeweapons", 0).. "/20\n"
        str = str .. "Unarmed: " ..char:GetAttribute("unarmed", 0).. "/20\n"
        str = str .. "Explosives: " ..char:GetAttribute("explosives", 0).. "/20\n"
        str = str .. "Medicine: " ..char:GetAttribute("medicine", 0).. "/20\n"
        str = str .. "Evasion: " ..char:GetAttribute("evasion", 0).. "/20\n"
        str = str .. "Survival: " ..char:GetAttribute("survival", 0).. "/20\n"
        str = str .. "Science: " ..char:GetAttribute("science", 0).. "/20\n"
        str = str .. "Repair: " ..char:GetAttribute("repair", 0).. "/20\n"
        str = str .. "Lockpicking: " ..char:GetAttribute("lockpicking", 0).. "/20\n"
        return str
	end
})

ix.command.Add("MyProgress", {
	description = "View your current level, skill points, and progress.",
	OnRun = function(self, client)
		local str = ""
        local char = client:GetCharacter()
        
        str = str .. "Level: " .. char:GetLevel() .. "\n"
        str = str .. "Next Level in: " .. char:GetXPToNextLevel() - char:GetXP() .. " XP \n"
        str = str .. "Lifetime XP Gained: " ..char:GetLifetimeXP() .. "\n"
        str = str .. "Skillpoints: " ..char:GetSkillPoints() .. "\n"
        return str
	end
})

ix.command.Add("CharGetSkills", {
	description = "View given player's skills.",
    AdminOnly = true,
    arguments = 
    {ix.type.character},
	OnRun = function(self, client, target)
		local str = ""
        local char = target

        str = str .. "Level: " .. char:GetLevel() .. "\n"
        str = str .. "Next Level in: " .. char:GetXPToNextLevel() - char:GetXP() .. " XP \n"
        str = str .. "Skillpoints: " ..char:GetSkillPoints() .. "\n\n"
        str =  str .. "Energy Weapons: " .. char:GetAttribute("energyweapons", 0).. "/20\n"
        str = str .. "Guns: " ..char:GetAttribute("guns", 0).. "/20\n"
        str = str .. "Melee Weapons: " ..char:GetAttribute("meleeweapons", 0).. "/20\n"
        str = str .. "Explosives: " ..char:GetAttribute("explosives", 0).. "/20\n"
        str = str .. "Medicine: " ..char:GetAttribute("medicine", 0).. "/20\n"
        str = str .. "Evasion: " ..char:GetAttribute("evasion", 0).. "/20\n"
        str = str .. "Survival: " ..char:GetAttribute("survival", 0).. "/20\n"
        str = str .. "Science: " ..char:GetAttribute("science", 0).. "/20\n"
        str = str .. "Repair: " ..char:GetAttribute("repair", 0).. "/20\n"
        str = str .. "Medicine: " ..char:GetAttribute("medicine", 0).. "/20\n"
        str = str .. "Lockpicking: " ..char:GetAttribute("lockpicking", 0).. "/20\n"
        return str
	end
})

ix.command.Add("CharAddSkillpoints", {
    description = "Add skill points to a character.",
    adminOnly = true,
    arguments = {
    ix.type.character, 
    ix.type.number},
    OnRun = function(self, client, target, points)
        local currentpoints = target:GetSkillPoints()
        target:SetSkillPoints(currentpoints + points)
        client:Notify(target:GetName() .. " now has " .. tostring(currentpoints + points .. " skill points."))
    end
})

ix.command.Add("SpendSkillpoints", {
    description = "Spend some of your skill points on your skills. Skill name is one word.",
    arguments = {
    ix.type.string, 
    ix.type.number},
    OnRun = function(self, client, skill, pointstospend)
        local char = client:GetCharacter()
        local ply = client
        local currentpoints = char:GetSkillPoints()
        local skill = string.lower(skill)

        
        
        if (currentpoints == 0) then
            client:NewVegasNotify("You don't have any skillpoints to spend.", "messageSad", 8)
            return
        end 

        if (pointstospend < 0) then
            client:NewVegasNotify("Cannot spend a negative number of points.", "messageSad", 8)
            return
        end 

        if (currentpoints < pointstospend) then
            client:NewVegasNotify("You don't have enough skillpoints to upgrade your skill to that level.", "messageSad", 8)
            return
        end 

        local skillLevel = char:GetSkill(skill)

        if not (skillLevel == nil) then

            if (skillLevel + pointstospend > 20) then
                client:NewVegasNotify("You cannot raise a skill above 20.", "messageSad", 8)
                return
            end 

            char:SetSkill(skill, skillLevel + pointstospend)
            local newlevel = char:GetSkill(skill, 0)
            char:SetSkillPoints(char:GetSkillPoints() - pointstospend)
            client:NewVegasNotify("Your " .. skill .. " skill has been increased from " ..skillLevel.. " to " ..newlevel.. ". \n Skillpoints Remaining: " .. char:GetSkillPoints(), "messageNeutral", 8)
        else 
            client:NewVegasNotify("Invalid skill name.", "messageSad", 8)
        end 
        
        return
        
    end
})



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


function PLUGIN:OnCharacterCreated(client, character)
    -- After char creation, get character's SPECIAL and assign skills based on these
    local strength = character:GetAttribute("strength")
    local perception = character:GetAttribute("perception")
    local endurance = character:GetAttribute("endurance")
    local charisma = character:GetAttribute("charisma")
    local intelligence = character:GetAttribute("intelligence")
    local agility = character:GetAttribute("agility")
    local luck = character:GetAttribute("luck")

    character:SetMelee(strength * 2 + luck)
    character:SetUnarmed(strength * 2 + luck)

    character:SetEnergyWeapons(perception * 2 + luck)
    character:SetExplosives(perception * 2 + luck)
    character:SetLockpick(perception * 2 + luck)

    character:SetSurvival(endurance * 2 + luck)

    character:SetScience(intelligence * 2 + luck)
    character:SetRepair(intelligence * 2 + luck)
    character:SetMedicine(intelligence * 2 + luck)

    character:SetGuns(agility * 2 + luck)
    character:SetEvasion(agility * 2 + luck)

end 

ix.command.Add("MySkills", {
	description = "View your current skills.",
	OnRun = function(self, client)
		local str = ""
        local char = client:GetCharacter()
    
        if (char:GetSkillPoints() > 0) then
            str =  str .. "You have unspent skill points! /spendskillpoints to use.\n"
        end 
        str =  str .. "Energy Weapons: " .. char:GetEnergyWeapons().. "/20\n"
        str = str .. "Guns: " ..char:GetGuns().. "/20\n"
        str = str .. "Melee Weapons: " ..char:GetMelee().. "/20\n"
        str = str .. "Unarmed: " ..char:GetUnarmed().. "/20\n"
        str = str .. "Explosives: " ..char:GetExplosives().. "/20\n"
        str = str .. "Medicine: " ..char:GetMedicine().. "/20\n"
        str = str .. "Evasion: " ..char:GetEvasion().. "/20\n"
        str = str .. "Survival: " ..char:GetSurvival().. "/20\n"
        str = str .. "Science: " ..char:GetScience().. "/20\n"
        str = str .. "Repair: " ..char:GetRepair().. "/20\n"
        str = str .. "Medicine: " ..char:GetMedicine().. "/20\n"
        str = str .. "Lockpicking: " ..char:GetLockpick().. "/20\n"
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
        str =  str .. "Energy Weapons: " .. char:GetEnergyWeapons().. "/20\n"
        str = str .. "Guns: " ..char:GetGuns().. "/20\n"
        str = str .. "Melee Weapons: " ..char:GetMelee().. "/20\n"
        str = str .. "Explosives: " ..char:GetExplosives().. "/20\n"
        str = str .. "Medicine: " ..char:GetMedicine().. "/20\n"
        str = str .. "Evasion: " ..char:GetEvasion().. "/20\n"
        str = str .. "Survival: " ..char:GetSurvival().. "/20\n"
        str = str .. "Science: " ..char:GetScience().. "/20\n"
        str = str .. "Repair: " ..char:GetRepair().. "/20\n"
        str = str .. "Medicine: " ..char:GetMedicine().. "/20\n"
        str = str .. "Lockpicking: " ..char:GetLockpick().. "/20\n"
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
        local skill = skill
        
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

         -- Catch some edge cases
         if (string.upper(skill) == "ENERGY" or string.upper(skill) == "ENERGYWEAPONS") then 
            skill = "EnergyWeapons"
        elseif (string.upper(skill) == "MELEEWEAPONS") then 
            skill = "Melee"
        elseif (string.upper(skill) == "LOCKPICKING") then 
            skill = "Lockpick"
        else 
            -- Most skills will end up here - ensure first letter is capitalized and the rest is lowercase.
            skill = string.upper(string.sub(skill, 1, 1)) .. string.lower(string.sub(skill, 2))
        end 
    
        -- Ensure that the given skill exists, spit out error and end if not.
        local getterFunc = char["Get" .. skill] 
        if not (getterFunc) then
            return client:NewVegasNotify("Invalid Skill.", "messageSad", 8)
        end 

        -- Use setter function to prepare set function, and get skill level
        local setterFunc = char["Set" .. skill]
        local skillLevel = getterFunc(char)

        if (skillLevel + pointstospend > 20) then
            return client:NewVegasNotify("Cannot upgrade a skill beyond 20.", "messageSad", 8)
        end 

        -- Use setter function with given skill and points to spend, deduct skill points.
        setterFunc(char, skillLevel + pointstospend)
        local newlevel =  getterFunc(char)
        char:SetSkillPoints(currentpoints - pointstospend)
        client:NewVegasNotify("Your " .. skill .. " skill has been increased from " ..skillLevel.. " to " ..newlevel.. ". \n Skillpoints Remaining: " .. char:GetSkillPoints(), "messageNeutral", 8)
        return
        
    end
})



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

ix.char.RegisterVar("Sneak", {
    field = "sneak",
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

    character:SetEnergyWeapons(perception * 2 + luck)
    character:SetExplosives(perception * 2 + luck)
    character:SetLockpick(perception * 2 + luck)

    character:SetSurvival(endurance * 2 + luck)

    character:SetScience(intelligence * 2 + luck)
    character:SetRepair(intelligence * 2 + luck)
    character:SetMedicine(intelligence * 2 + luck)

    character:SetGuns(agility * 2 + luck)
    character:SetSneak(agility * 2 + luck)

	
end 

ix.command.Add("MySkills", {
	description = "View your current skills.",
	OnRun = function(self, client)
		local str = ""
        local char = client:GetCharacter()
    
        if (char:GetSkillPoints() > 0) then
            str =  str .. "You have unspent skill points! /spendskillpoints to use.\n"
        end 
        str =  str .. "Energy Weapons: " .. char:GetEnergyWeapons().. "/100\n"
        str = str .. "Guns: " ..char:GetGuns().. "/100\n"
        str = str .. "Melee Weapons: " ..char:GetMelee().. "/100\n"
        str = str .. "Explosives: " ..char:GetExplosives().. "/100\n"
        str = str .. "Medicine: " ..char:GetMedicine().. "/100\n"
        str = str .. "Sneak: " ..char:GetSneak().. "/100\n"
        str = str .. "Survival: " ..char:GetSurvival().. "/100\n"
        str = str .. "Science: " ..char:GetScience().. "/100\n"
        str = str .. "Repair: " ..char:GetRepair().. "/100\n"
        str = str .. "Medicine: " ..char:GetMedicine().. "/100\n"
        str = str .. "Lockpicking: " ..char:GetLockpick().. "/100\n"
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
        str = str .. "Skillpoints: " ..char:GetSkillPoints() .. "\n\n"
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
        str =  str .. "Energy Weapons: " .. char:GetEnergyWeapons().. "/100\n"
        str = str .. "Guns: " ..char:GetGuns().. "/100\n"
        str = str .. "Melee Weapons: " ..char:GetMelee().. "/100\n"
        str = str .. "Explosives: " ..char:GetExplosives().. "/100\n"
        str = str .. "Medicine: " ..char:GetMedicine().. "/100\n"
        str = str .. "Sneak: " ..char:GetSneak().. "/100\n"
        str = str .. "Survival: " ..char:GetSurvival().. "/100\n"
        str = str .. "Science: " ..char:GetScience().. "/100\n"
        str = str .. "Repair: " ..char:GetRepair().. "/100\n"
        str = str .. "Medicine: " ..char:GetMedicine().. "/100\n"
        str = str .. "Lockpicking: " ..char:GetLockpick().. "/100\n"
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
        char = client:GetCharacter()
        currentpoints = char:GetSkillPoints()
        skill = string.upper(skill)

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

        if (skill == "GUNS") then
            currentlevel = char:GetGuns()
            if (currentlevel >= 100) then
                client:NewVegasNotify("That skill is already at max level!", "messageNeutral", 8)
                return
            end 
            if (currentlevel + pointstospend > 100) then
                client:NewVegasNotify("You cannot raise a skill above 100.", "messageNeutral", 8)
                return
            end 
            char:SetGuns(currentlevel + pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:NewVegasNotify("Successfully upgraded Guns from " .. currentlevel .. " to " .. char:GetGuns() .. ".\n Skillpoints remaining: " .. char:GetSkillPoints(), "messageNeutral", 10)
            return
        end 

        if (skill == "EXPLOSIVES") then
            currentlevel = char:GetExplosives()
            if (currentlevel >= 100) then
                client:NewVegasNotify("That skill is already at max level!", "messageNeutral", 8)
                return
            end 
            if (currentlevel + pointstospend > 100) then
                client:NewVegasNotify("You cannot raise a skill above 100.", "messageNeutral", 8)
                return
            end 
            char:SetExplosives(currentlevel + pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:NewVegasNotify("Successfully upgraded Explosives from " .. currentlevel .. " to " .. char:GetExplosives() .. ".\n Skillpoints remaining: " .. char:GetSkillPoints(), "messageNeutral", 10)
            return
        end 

        if (skill == "ENERGYWEAPONS") then
            currentlevel = char:GetEnergyWeapons()
            if (currentlevel >= 100) then
                client:NewVegasNotify("That skill is already at max level!", "messageNeutral", 8)
                return
            end 
            if (currentlevel + pointstospend > 100) then
                client:NewVegasNotify("You cannot raise a skill above 100.", "messageNeutral", 8)
                return
            end 
            char:SetEnergyWeapons(currentlevel + pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:NewVegasNotify("Successfully upgraded Energy Weapons from " .. currentlevel .. " to " .. char:GetEnergyWeapons() .. ".\n Skillpoints remaining: " .. char:GetSkillPoints(), "messageNeutral", 10)
            return
        end 

        if (skill == "MELEEWEAPONS" or skill == "MELEE") then
            currentlevel = char:GetMelee()
            if (currentlevel >= 100) then
                client:NewVegasNotify("That skill is already at max level!", "messageNeutral", 8)
                return
            end 
            if (currentlevel + pointstospend > 100) then
                client:NewVegasNotify("You cannot raise a skill above 100.", "messageNeutral", 8)
                return
            end 
            char:SetMelee(currentlevel + pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:NewVegasNotify("Successfully upgraded Melee Weapons from " .. currentlevel .. " to " .. char:GetMelee() .. ".\n Skillpoints remaining: " .. char:GetSkillPoints(), "messageNeutral", 10)
            return
        end 


        if (skill == "SCIENCE") then
            currentlevel = char:GetScience()
            if (currentlevel >= 100) then
                client:NewVegasNotify("That skill is already at max level!", "messageNeutral", 8)
                return
            end 
            if (currentlevel + pointstospend > 100) then
                client:NewVegasNotify("You cannot raise a skill above 100.", "messageNeutral", 8)
                return
            end 
            char:SetScience(currentlevel + pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:NewVegasNotify("Successfully upgraded Science from " .. currentlevel .. " to " .. char:GetScience() .. ".\n Skillpoints remaining: " .. char:GetSkillPoints(), "messageNeutral", 10)
            return
        end 

        if (skill == "MEDICINE") then
            currentlevel = char:GetMedicine()
            if (currentlevel >= 100) then
                client:NewVegasNotify("That skill is already at max level!", "messageNeutral", 8)
                return
            end 
            if (currentlevel + pointstospend > 100) then
                client:NewVegasNotify("You cannot raise a skill above 100.", "messageNeutral", 8)
                return
            end 
            char:SetMedicine(currentlevel + pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:NewVegasNotify("Successfully upgraded Medicine from " .. currentlevel .. " to " .. char:GetMedicine() .. ".\n Skillpoints remaining: " .. char:GetSkillPoints(), "messageNeutral", 10)
            return
        end 

        if (skill == "REPAIR") then
            currentlevel = char:GetRepair()
            if (currentlevel >= 100) then
                client:NewVegasNotify("That skill is already at max level!", "messageNeutral", 8)
                return
            end 
            if (currentlevel + pointstospend > 100) then
                client:NewVegasNotify("You cannot raise a skill above 100.", "messageNeutral", 8)
                return
            end 
            char:SetRepair(currentlevel + pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:NewVegasNotify("Successfully upgraded Repair from " .. currentlevel .. " to " .. char:GetRepair() .. ".\n Skillpoints remaining: " .. char:GetSkillPoints(), "messageNeutral", 10)
            return
        end 

        if (skill == "SURVIVAL") then
            currentlevel = char:GetSurvival()
            if (currentlevel >= 100) then
                client:NewVegasNotify("That skill is already at max level!", "messageNeutral", 8)
                return
            end 
            if (currentlevel + pointstospend > 100) then
                client:NewVegasNotify("You cannot raise a skill above 100.", "messageNeutral", 8)
                return
            end 
            char:SetSurvival(currentlevel + pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:NewVegasNotify("Successfully upgraded Repair from " .. currentlevel .. " to " .. char:GetSurvival() .. ".\n Skillpoints remaining: " .. char:GetSkillPoints(), "messageNeutral", 10)
            return
        end 

        if (skill == "SNEAK") then
            currentlevel = char:GetSneak()
            if (currentlevel >= 100) then
                client:NewVegasNotify("That skill is already at max level!", "messageNeutral", 8)
                return
            end 
            if (currentlevel + pointstospend > 100) then
                client:NewVegasNotify("You cannot raise a skill above 100.", "messageNeutral", 8)
                return
            end 
            char:SetSneak(currentlevel + pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:NewVegasNotify("Successfully upgraded Repair from " .. currentlevel .. " to " .. char:GetSneak() .. ".\n Skillpoints remaining: " .. char:GetSkillPoints(), "messageNeutral", 10)
            return
        end 

        if (skill == "LOCKPICK" or skill == "LOCKPICKING") then
            currentlevel = char:GetLockpick()
            if (currentlevel >= 100) then
                client:NewVegasNotify("That skill is already at max level!", "messageNeutral", 8)
                return
            end 
            if (currentlevel + pointstospend > 100) then
                client:NewVegasNotify("You cannot raise a skill above 100.", "messageNeutral", 8)
                return
            end 
            char:SetLockpick(currentlevel + pointstospend)
            char:SetSkillPoints(currentpoints - pointstospend)
            client:NewVegasNotify("Successfully upgraded Repair from " .. currentlevel .. " to " .. char:GetLockpick() .. ".\n Skillpoints remaining: " .. char:GetSkillPoints(), "messageNeutral", 10)
            return
        end 

        client:NewVegasNotify("That skill doesn't exist!", "messageSad", 10)
        return

    end
})
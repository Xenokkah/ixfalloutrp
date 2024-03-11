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

function PLUGIN:OnCharacterCreated(client, character)
    -- After char creation, get character's SPECIAL and assign skills based on these
    local strength = character:GetAttribute("strength")
    local perception = character:GetAttribute("perception")
    local endurance = character:GetAttribute("endurance")
    local charisma = character:GetAttribute("charisma")
    local intelligence = character:GetAttribute("intelligence")
    local agility = character:GetAttribute("agility")
    local luck = character:GetAttribute("luck")

    character:SetSkillPoints(10)

    luckboost = math.ceil(luck / 2)

    character:SetSkill("meleeweapons", strength + luckboost)
    
    character:SetSkill("energyweapons", perception + luckboost)
    character:SetSkill("explosives", perception + luckboost)
    character:SetSkill("lockpicking", perception + luckboost)

    character:SetSkill("survival", endurance + luckboost)
    character:SetSkill("unarmed", endurance + luckboost)

    character:SetSkill("speech", charisma + luckboost)
    character:SetSkill("barter", charisma + luckboost)

    character:SetSkill("science", intelligence + luckboost)
    character:SetSkill("repair", intelligence + luckboost)
    character:SetSkill("medicine", intelligence + luckboost)

    character:SetSkill("guns", agility + luckboost)
    character:SetSkill("evasion", agility + luckboost)




    -- Background Traits --
    if character:HasFeat("tribal") then
        local unarmedboost = math.Clamp(character:GetSkill("unarmed") + 5, 0, 50)
        local meleeboost = math.Clamp(character:GetSkill("meleeweapons") + 5, 0, 50)
        local survivalboost = math.Clamp(character:GetSkill("survival") + 5, 0, 50)
        local energygunsdebuff = math.Clamp(character:GetSkill("energyweapons") -5, 0, 50)
        local sciencedebuff = math.Clamp(character:GetSkill("science")  -5, 0, 50)
        local medicinedebuff = math.Clamp(character:GetSkill("medicine") -5, 0, 50)
        character:SetSkill("unarmed", unarmedboost)
        character:SetSkill("meleeweapons", meleeboost)
        character:SetSkill("survival", survivalboost)
        character:SetSkill("energyweapons", energygunsdebuff)
        character:SetSkill("science", sciencedebuff)
        character:SetSkill("medicine", medicinedebuff)
    end 

    if character:HasFeat("cityslicker") then
        local lockpickboost = math.Clamp(character:GetSkill("lockpicking") + 5, 0, 50)
        local evasionboost = math.Clamp(character:GetSkill("evasion") + 5, 0, 50)
        local sciencedebuff = math.Clamp(character:GetSkill("science") -5, 0, 50)
        local explosivesdebuff = math.Clamp(character:GetSkill("explosives")  -5, 0, 50)
        character:SetSkill("lockpicking", lockpickboost)
        character:SetSkill("evasion", evasionboost)
        character:SetSkill("science", sciencedebuff)
        character:SetSkill("explosives", explosivesdebuff)
    end 

    if character:HasFeat("mechanic") then
        local repairboost = math.Clamp(character:GetSkill("repair") + 5, 0, 50)
        local energygunsboost = math.Clamp(character:GetSkill("energyweapons") + 5, 0, 50)
        local meleedebuff = math.Clamp(character:GetSkill("meleeweapons") -5, 0, 50)
        local unarmeddebuff = math.Clamp(character:GetSkill("unarmed")  -5, 0, 50)
        character:SetSkill("repair", repairboost)
        character:SetSkill("energyweapons", energygunsboost)
        character:SetSkill("meleeweapons", meleedebuff)
        character:SetSkill("unarmed", unarmeddebuff)
    end 

    if character:HasFeat("junkie") then
        local gunsboost = math.Clamp(character:GetSkill("guns") + 5, 0, 50)
        local scienceboost = math.Clamp(character:GetSkill("science") + 5, 0, 50)
        local evasiondebuff = math.Clamp(character:GetSkill("evasion") -5, 0, 50)
        local medicinedebuff = math.Clamp(character:GetSkill("medicine")  -5, 0, 50)
        character:SetSkill("guns", gunsboost)
        character:SetSkill("science", scienceboost)
        character:SetSkill("evasion", evasiondebuff)
        character:SetSkill("medicine", medicinedebuff)
    end 

    if character:HasFeat("soldier") then
        local gunsboost = math.Clamp(character:GetSkill("guns") + 5, 0, 50)
        local explosivesboost = math.Clamp(character:GetSkill("explosives") + 5, 0, 50)
        local survivaldebuff = math.Clamp(character:GetSkill("survival") -5, 0, 50)
        local lockpickingdebuff = math.Clamp(character:GetSkill("lockpicking")  -5, 0, 50)
        character:SetSkill("guns", gunsboost)
        character:SetSkill("explosives", explosivesboost)
        character:SetSkill("survival", survivaldebuff)
        character:SetSkill("lockpicking", lockpickingdebuff)
    end 

    if character:HasFeat("doctor") then
        local medicineboost = math.Clamp(character:GetSkill("medicine") + 5, 0, 50)
        local scienceboost = math.Clamp(character:GetSkill("science") + 5, 0, 50)
        local gunsdebuff = math.Clamp(character:GetSkill("guns") -5, 0, 50)
        local meleedebuff = math.Clamp(character:GetSkill("meleeweapons")  -5, 0, 50)
        character:SetSkill("medicine", medicineboost)
        character:SetSkill("science", scienceboost)
        character:SetSkill("guns", gunsdebuff)
        character:SetSkill("meleeweapons", meleedebuff)
    end 

end 

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
        str =  str .. "Energy Weapons: " .. char:GetSkill("energyweapons", 0).. "/50\n"
        str = str .. "Guns: " ..char:GetSkill("guns", 0).. "/50\n"
        str = str .. "Melee Weapons: " ..char:GetSkill("meleeweapons", 0).. "/50\n"
        str = str .. "Explosives: " ..char:GetSkill("explosives", 0).. "/50\n"
        str = str .. "Medicine: " ..char:GetSkill("medicine", 0).. "/50\n"
        str = str .. "Evasion: " ..char:GetSkill("evasion", 0).. "/50\n"
        str = str .. "Survival: " ..char:GetSkill("survival", 0).. "/50\n"
        str = str .. "Science: " ..char:GetSkill("science", 0).. "/50\n"
        str = str .. "Repair: " ..char:GetSkill("repair", 0).. "/50\n"
        str = str .. "Medicine: " ..char:GetSkill("medicine", 0).. "/50\n"
        str = str .. "Lockpicking: " ..char:GetSkill("lockpicking", 0).. "/50\n"
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

            if (skillLevel + pointstospend > 50) then
                client:NewVegasNotify("You cannot raise a skill above 50.", "messageSad", 8)
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



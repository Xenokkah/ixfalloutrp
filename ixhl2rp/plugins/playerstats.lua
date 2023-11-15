PLUGIN.name = 'Player Stats'
PLUGIN.author = 'Scrat Knapp'
PLUGIN.description = "Adds stats and commands for manging player health, armor, and AP tabletop style."

local playerMeta = FindMetaTable("Player")
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
    field = "charetboost",
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
    field = "charapboost",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("charradresist", {
    field = "charradresist",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})

ix.char.RegisterVar("charradresistboost", {
    field = "charradresistboost",
    fieldType = ix.type.number,
    default = 0,
    isLocal = true,
    bNoDisplay = true
})



function playerMeta:GetTotalCharHp()
    local maxhp = self:GetCharacter():GetCharmaxhp() + self:GetCharacter():GetCharmaxhpboost()
   -- self:SetMaxHealth(maxhp)
	return maxhp
end

function playerMeta:GetTotalCharDt()
	return self:GetCharacter():GetChardt() + self:GetCharacter():GetChardtboost()
end

function playerMeta:GetTotalCharDr()
	return self:GetCharacter():GetChardr() + self:GetCharacter():GetChardrboost()
end

function playerMeta:GetTotalCharEt()
	return self:GetCharacter():GetCharet() + self:GetCharacter():GetCharetboost()
end

function playerMeta:GetTotalCharAp()
	return self:GetCharacter():GetCharap() + self:GetCharacter():GetCharapboost()
end

function playerMeta:GetTotalCharAp()
	return self:GetCharacter():GetCharap() + self:GetCharacter():GetCharapboost()
end

function playerMeta:GetTotalCharRadResist()
	return self:GetCharacter():GetCharradresist() + self:GetCharacter():GetCharradresistboost()
end

function playerMeta:GetTotalCharRadResist()
	return self:GetCharacter():GetCharradresist() + self:GetCharacter():GetCharradresistboost()
end

function playerMeta:AdjustHealth(type, amount)

    local char = self:GetCharacter()
    local player = self

    maxhp = self:GetTotalCharHp()
    stagger = maxhp * 0.80
    stun = maxhp * 0.40
    incap = 0
	
    if type == "hurt" then
        char:SetCharcurrenthp(char:GetCharcurrenthp() - amount)
        if char:GetCharcurrenthp() < 0 then char:SetCharcurrenthp(0)
        player:SetHealth(player:Health() - amount)


        newhp = char:GetCharcurrenthp()

        if newhp == 0 then
            player:Notify("You're incapacitated and unable to fight.")

            char:AddBoost("incap", "endurance", -3)
		    char:AddBoost("incap", "agility", -3)
            char:AddBoost("incap", "perception", -3)
            char:AddBoost("incap", "strength", -3)
        end 




    end 
end 
end 






ix.command.Add("Status", {
	description = "View your current health, AP, and resistances.",
	OnRun = function(self, client)
		local str = ""
        local char = client:GetCharacter()
        
        str = str .. "\nHealth: " .. char:GetCharcurrenthp() .. "/" .. client:GetTotalCharHp()
        if char:GetCharmaxhpboost() > 0 then str = str .. " (+)" end
        str = str .. "\n"

        str = str .. "AP: " .. client:GetTotalCharAp()
        if char:GetCharapboost() > 0 then str = str .. " (+)" end
        str = str .. "\n"

        str = str .. "Rad Resistance: " .. client:GetTotalCharRadResist() .. "%"
        if char:GetCharradresistboost() > 0 then str = str .. " (+)" end
        str = str .. "\n"

        str = str .. "DT: " .. client:GetTotalCharDt()
        if char:GetChardtboost() > 0 then str = str .. " (+)" end
        str = str .. "\n"

        str = str .. "ET: " .. client:GetTotalCharEt()
        if char:GetCharetboost() > 0 then str = str .. " (+)" end
        str = str .. "\n"
        
        str = str .. "DR: " .. client:GetTotalCharDr()
        if char:GetChardrboost() > 0 then str = str .. " (+)" end
        str = str .. "\n"
        
        return str
	end
})


ix.command.Add("Damage", {
    description = "Inflict damage on a player.",
    adminOnly = true,
    arguments = {ix.type.character, ix.type.string, ix.type.number, bit.bor(ix.type.number, ix.type.optional)},
    OnRun = function(self, client, target, damtype, damage, ap)
        local char = target
        local player = target:GetPlayer()


        -- Get player armor and health stats
        local dt = player:GetTotalCharDt()
        local et = player:GetTotalCharEt()
        local dr = player:GetTotalCharDr()
        local hp = player:GetTotalCharHp()

        -- Format entries so that they're ready to work with - lowercase damtype, chop off any decimal points
        local damtype = string.lower(damtype)
        local damage = damage - (damage % 1)
        if (ap) then local ap = ap - (ap % 1) else ap = 0 end

       


        -- Ballistic weapons, blasts, and melee
        if damtype == "bullet" then
            player:Notify("You're hit with ".. damage .. " physical damage!")
            if (ap > 0) then player:Notify("It pierces " .. ap .. " points of DT!") end

            -- Subtract AP value from DT value. Since you can't have negative protection, if below 0, make 0.
            dt = dt - ap 
            if dt < 0 then dt = 0 end

            damage = damage - dt
            if damage < 0 then damage = 0 end

            player:Notify("Your armor reduces the damage by " .. dt .. "!")

            if damage > 0 then
                player:Notify("You take " .. damage  .. " damage!")
                player:AdjustHealth("hurt", damage)
            else 
                player:Notify("Your armor tanks the shot completely!")
            end 


        -- Laser, Plasma, Fire 
        elseif damtype == "laser" then

        

        -- Bleeding damage. Bypasses armor
        elseif damtype == "bleed" then
            client:Notify(target:GetName() .. " has taken " .. damage .. " bleed damage!")
            player:Notify("You have taken " .. damage .. " bleed damage!")
        
        -- Poison damage. Bypasses armor
        elseif damtype == "poison" then
            client:Notify(target:GetName() .. " has taken " .. damage .. " poison damage!")
            player:Notify("You have taken " .. damage .. " poison damage!")

        -- Some other form of damage as necessary. Bypasses armor
        elseif damtype == "direct" then
            client:Notify(target:GetName() .. " has taken " .. damage .. " damage!")
            player:Notify("You have taken " .. damage .. " damage!")
        else 
            return "Invalid damage type. Accepted options: Bullet, Laser, Bleed, Poison, Direct"
        end 

        
       
        
        

       --ix.log.Add(client, "rollStat", value, attr, add, modifier)
    end
})


ix.command.Add("Heal", {
    description = "Heal all damages done to player.",
    adminOnly = true,
    arguments = {ix.type.character},
    OnRun = function(self, client, target, damtype, damage, ap)
        local char = target
        local player = target:GetPlayer()

        char:SetCharcurrenthp(player:GetTotalCharHp())
        player:SetHealth(player:GetTotalCharHp())
        player:SetMaxHealth(player:GetTotalCharHp())
        
    end
})
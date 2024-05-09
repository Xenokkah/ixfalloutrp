local PLUGIN = PLUGIN

local function StringMatch(a, b)
    if a and b then
              local a2, b2 = a:lower(), b:lower()
              if a == b then 
                        return true 
              end
              if a2 == b2 then 
                        return true 
              end
              if a:find(b) then 
                        return true 
              end
              if a2:find(b2) then 
                        return true 
              end
    end
    return false
end
local function FindCent(identifier)
    for _, v in ipairs(ents.GetAll()) do
            if IsValid(v) and StringMatch(v.name, identifier) then 
                return v 
            end
    end
end


ix.command.Add("CEntWhisper", {
    arguments = ix.type.text,
    alias = {"CEntW"},
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_w", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

ix.command.Add("CEntSay", {
    arguments = ix.type.text,
    alias = {"CEntTalk"},
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_ic", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

ix.command.Add("CEntYell", {
    arguments = ix.type.text,
    alias = {"CEntY"},
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_y", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

ix.command.Add("CEntMe", {
    arguments = ix.type.text,
    OnRun = function(self, client, text)
        local privilege = CAMI.PlayerHasAccess(client, "Helix - Manage CEnts", nil)

        local entity = client:GetEyeTrace().Entity

        if privilege then
            if (IsValid(entity) and entity.combatEntity) then
                ix.chat.Send(entity, "cent_me", text)
            else
                return "You are not looking at a valid entity!"
            end
        else
            return "You are not allowed to do this!"
        end
    end
})

local wepmodelz = {
	"models/weapons/w_smg1.mdl";
	"models/weapons/w_357.mdl";
	"models/weapons/w_shotgun.mdl";
	"models/weapons/w_irifle.mdl";
	"models/weapons/w_pistol.mdl";
	"models/weapons/w_crossbow.mdl";
	"models/weapons/w_rocket_launcher.mdl";
}
ix.command.Add("CEntWeapon", {
	--syntax = "OPTIONAL: <string Model>",
	adminOnly = true,
	description = "Add a random or specific weapon to a cent's hands.",
	arguments = {bit.bor(ix.type.string, ix.type.optional)},
    argumentNames = {"OPTIONAL - modelpath"},
	OnRun = function(self, client, modelpath)
		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then
			entity:SetCEntWeaponModel(modelpath)
		end
	end
})

ix.command.Add("CEntMove", {
	syntax = "<string centname> <string character>",
	adminOnly = true,
	description = "Teleport a cent to a character's location.",
	arguments = {ix.type.string, ix.type.character},
	OnRun = function(self, client, string, character)
		local centtarget = FindCent(string)
		--print(centtarget.name.." has been moved to "..character:GetName())
		centtarget:SetPos(character.player:GetPos())
	end
})

ix.command.Add("CentMovetome", {
	syntax = "<string centname>",
	adminOnly = true,
	description = "Teleport a cent to your location.",
	arguments = {ix.type.string},
	OnRun = function(self, client, string)
		local centtarget = FindCent(string)
		--print(centtarget.name.." has been moved to "..client:GetName())
		centtarget:SetPos(client:GetPos())
	end
})

ix.command.Add("CEntfollow", {

	adminOnly = true,

	syntax = "<string target>",

	OnRun = function(self, client, arguments)	

		local entity = client:GetEyeTrace().Entity

		if !(IsValid(entity) and entity.combatEntity) then

			client:Notify("You must be looking at a combat entity.")

			return false

		end

	

		if(!arguments[1]) then 

			entity.follow = nil

			client:Notify(entity:Name().. " no longer following.")

			return

		end

	

		local target = ix.command.FindPlayer(client, arguments[1])

		if(IsValid(target)) then

			entity.follow = target

			client:Notify(entity:Name().. " is now following " ..target:Name().. ".")

		end

	end

})



ix.command.Add("centfollowstop", {

	adminOnly = true,

	OnRun = function(self, client, arguments)	

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			entity.follow = nil

			client:Notify(entity:Name().. " no longer following.")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})
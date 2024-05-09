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

ix.command.Add("centweapon", {
	--syntax = "OPTIONAL: <string Model>",
	adminOnly = true,
	description = "Add a random or specific weapon to a cent's hands.",
	arguments = {bit.bor(ix.type.string, ix.type.optional)},
    argumentNames = {"OPTIONAL - modelpath"},
	OnRun = function(self, client, modelpath)
		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then
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



ix.command.Add("CEntfollowstop", {

	adminOnly = true,

	OnRun = function(self, client, arguments)	

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity.follow = nil

			client:Notify(entity:Name().. " no longer following.")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntclone", {

	adminOnly = true,

	OnRun = function(self, client, arguments)

		local entity = client:GetEyeTrace().Entity --entity that we're looking at

		

		if (IsValid(entity) and entity.combatEntity) then --makes sure it's a CEnt (Combat Entity)

			local clone = ents.Create(entity:GetClass()) --the new clone entity

			clone:SetPos(entity:GetPos()) --set its position

			clone:SetAngles(entity:GetAngles()) --set its angles

			

			clone:Spawn() --spawn it

			

			clone:SetModel(entity:GetModel()) --set its model

			clone:SetMaterial(entity:GetMaterial() or "") --set its material

			clone:SetColor(entity:GetColor() or Color(255,255,255))

			

			clone:SetNetVar("name", entity:Name()) --set its custom name

			clone:SetNetVar("desc", entity:GetDescription()) --set its description



			clone:SetCEntWeaponModel(entity:GetWeaponModel())

			

			--set its attributes

			--clone.attribs = entity.attribs

			

			--combat stats

			--clone.armor = entity.armor

			

			clone:SetCombatHealth(entity:GetCombatHealth())
			clone:SetCombatHealthMax(entity:GetCombatHealthMax())



			

			--clone:SetNetVar("mp", entity:getMP())

			--clone:SetNetVar("mpMax", entity:getMaxMP())

			

			--clone.actions = entity.actions

			

			--clone.dmg = entity.dmg

			--clone.res = entity:GetNetVar("res")

			--clone.amp = entity:GetNetVar("amp")

			

			clone:SetCreator(client) --prop protection

			

			--sets its animation

			timer.Simple(1, function()

				if IsValid(clone) then

					clone:ResetSequence(entity:GetSequence())

				end

			end)

			if entity.curbonegun then 

				local ent = ents.Create("prop_physics")
				ent:SetPos(clone:GetPos() + Vector(0,0,60))
				ent:SetModel(entity.curbonegun)
				ent:Spawn()
				ent:Activate()

				clone.curbonegun = entity.curbonegun

				--local ent = self:GetSelectedEntity()
				timer.Simple(0.01, function()
					local newEntity = rb655_ApplyBonemerge( ent, clone )

					undo.Create( "bonemerge" )
						undo.AddEntity( newEntity )
						undo.SetPlayer( client )
					undo.Finish()
				end)

			end



			local name = entity:GetNetVar("name", entity.PrintName)

			client:Notify(name.. " has been cloned.") --Notify the player

		else --called if they aren't looking at the right thing

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntidlepose", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client, arguments)

		if(!arguments) then

			client:Notify("Specify an idle animation for the entity.")

			return false

		end

		

		local IdleAnim = table.concat(arguments, " ")

		

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:SetNetVar("IdleAnim", IdleAnim)

			timer.Simple(1, function()

				entity:ResetSequence(entity:LookupSequence(IdleAnim))

			end)

			client:Notify("Entity's idle animation has been changed to " ..IdleAnim.. ".")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntattack", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:AttackAnimStart(false)

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntaim", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:AttackAnimStart(true)

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntidle", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:SetAnim()

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntcrouchtoggle", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:Crouch()

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEntmaxhp", {

	adminOnly = true,

	syntax = "<int maxhp>",

	OnRun = function(self, client, arguments)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:SetCombatHealthMax(arguments[1])
			client:Notify("Set max health of CEnt " .. entity:Name() .. " to " .. arguments[1])

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

ix.command.Add("CEnthp", {

	adminOnly = true,

	syntax = "<int hp>",

	OnRun = function(self, client, arguments)

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combatEntity) then

			entity:SetCombatHealth(arguments[1])
			client:Notify("Sethealth of CEnt " .. entity:Name() .. " to " .. arguments[1] .. "/" .. entity:GetCombatHealthMax())


		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})
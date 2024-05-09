
local PLUGIN = PLUGIN

--thanks gristtard
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

		if (IsValid(entity) and entity.combat) then
			local random = table.Random(wepmodelz)
			local ent = ents.Create("prop_physics")
			ent:SetPos(entity:GetPos() + Vector(0,0,60))
			ent:SetModel(random)
			entity.curbonegun = random
			if modelpath and isstring(modelpath) then
				ent:SetModel(modelpath)
				entity.curbonegun = modelpath
			end
			ent:Spawn()
			ent:Activate()

			--local ent = self:GetSelectedEntity()
			timer.Simple(0.01, function()
				local newEntity = rb655_ApplyBonemerge( ent, entity )

				undo.Create( "bonemerge" )
					undo.AddEntity( newEntity )
					undo.SetPlayer( client )
				undo.Finish()
			end)
		
		end
	end
})

ix.command.Add("centmove", {
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

ix.command.Add("centmovetome", {
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

ix.command.Add("centsay", {

	adminOnly = true,

	syntax = "<string sentence>",

	OnRun = function(self, client, arguments)

		if(!arguments) then

			client:Notify("Put something for the CEnt to say.")

		end



		local msg = table.concat(arguments, " ")



		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			ix.chat.Send(entity, "say_npc", msg)

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



ix.command.Add("centme", {

	adminOnly = true,

	syntax = "<string sentence>",

	OnRun = function(self, client, arguments)

		if(!arguments) then

			client:Notify("Put something for the CEnt to me.")

		end



		local msg = table.concat(arguments, " ")



		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			ix.chat.Send(entity, "me_npc", msg)

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



ix.command.Add("centyell", {

	adminOnly = true,

	syntax = "<string sentence>",

	OnRun = function(self, client, arguments)

		if(!arguments) then

			client:Notify("Put something for the CEnt to yell.")

		end



		local msg = table.concat(arguments, " ")



		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			ix.chat.Send(entity, "yell_npc", msg)

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



ix.command.Add("centwhisper", {

	adminOnly = true,

	syntax = "<string sentence>",

	OnRun = function(self, client, arguments)

		if(!arguments) then

			client:Notify("Put something for the CEnt to whisper.")

		end



		local msg = table.concat(arguments, " ")



		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			ix.chat.Send(entity, "whisper_npc", msg)

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



/*



ix.command.Add("centwhisper", {

	adminOnly = true,

	syntax = "<string sentence>",

	OnRun = function(client, arguments)

		if(!arguments) then

			client:Notify("Put something for the CEnt to say.")

		end



		local msg = table.concat(arguments, " ")



		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			ix.chat.Send(entity, "whisper_npc", entity:Name().. " whispers \"" ..msg.."\"")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



ix.command.Add("centyell", {

	adminOnly = true,

	syntax = "<string sentence>",

	OnRun = function(client, arguments)

		if(!arguments) then

			client:Notify("Put something for the CEnt to say.")

		end



		local msg = table.concat(arguments, " ")



		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			ix.chat.Send(entity, "yell_npc", entity:Name().. " yells \"" ..msg.."\"")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



ix.command.Add("centme", {

	adminOnly = true,

	syntax = "<string action>",

	OnRun = function(client, arguments)

		if(!arguments) then

			client:Notify("Put something for the CEnt to do.")

		end



		local msg = table.concat(arguments, " ")



		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			ix.chat.Send(entity, "say_npc", "**" ..entity:GetNetVar("name", (entity.name or entity.PrintName)).. " " ..msg)

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})

*/

ix.command.Add("centname", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client, arguments)

		if(!arguments) then

			client:Notify("Specify a name for the entity.")

			return false

		end

		

		local name = table.concat(arguments, " ")

		

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			entity:SetNetVar("name", name)

			client:Notify("Entity's name has been changed to " ..name.. ".")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



ix.command.Add("centidlepose", {

	adminOnly = true,

	syntax = "<string name>",

	OnRun = function(self, client, arguments)

		if(!arguments) then

			client:Notify("Specify an idle animation for the entity.")

			return false

		end

		

		local IdleAnim = table.concat(arguments, " ")

		

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

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



ix.command.Add("centdesc", {

	adminOnly = true,

	syntax = "<string description>",

	OnRun = function(self, client, arguments)

		if(!arguments) then

			client:Notify("Specify a name for the entity.")

			return false

		end

		

		local desc = table.concat(arguments, " ")

		

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			entity:SetNetVar("desc", desc)

			client:Notify("Entity's description has been changed.")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



ix.command.Add("centmodel", {

	adminOnly = true,

	syntax = "<string model>",

	OnRun = function(self, client, arguments)

		if(!arguments[1]) then

			client:Notify("Specify a model for the entity.")

			return false

		end

		

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			entity:SetModel(arguments[1])

			

			for k, v in ipairs(entity:GetSequenceList()) do

				if (v:lower():find("idle") and v != "idlenoise") then

					entity:ResetSequence(k)

					break

				end

			end

			

			client:Notify("Entity's model has been changed.")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



ix.command.Add("centkill", {

	adminOnly = true,

	OnRun = function(self, client, arguments)		

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			entity:die()

			client:Notify(entity:GetNetVar("name").. " has been slain.")

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



--clones a target Cent

ix.command.Add("centclone", {

	adminOnly = true,

	OnRun = function(self, client, arguments)

		local entity = client:GetEyeTrace().Entity --entity that we're looking at

		

		if (IsValid(entity) and entity.combat) then --makes sure it's a CEnt (Combat Entity)

			local clone = ents.Create(entity:GetClass()) --the new clone entity

			clone:SetPos(entity:GetPos()) --set its position

			clone:SetAngles(entity:GetAngles()) --set its angles

			

			clone:Spawn() --spawn it

			

			clone:SetModel(entity:GetModel()) --set its model

			clone:SetMaterial(entity:GetMaterial() or "") --set its material

			clone:SetColor(entity:GetColor() or Color(255,255,255))

			

			clone:SetNetVar("name", entity:Name()) --set its custom name

			clone:SetNetVar("desc", entity:Desc()) --set its description



			--clone.inv = entity.inv

			

			--set its attributes

			--clone.attribs = entity.attribs

			

			--combat stats

			--clone.armor = entity.armor

			

			--clone:SetNetVar("hp", entity:getHP())

			--clone:SetNetVar("hpMax", entity:getMaxHP())

			

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



--clones a target Cent

ix.command.Add("centcopy", {

	adminOnly = true,

	OnRun = function(self, client, arguments)

		local entity = client:GetEyeTrace().Entity --entity that we're looking at

		

		if (IsValid(entity) and entity.combat) then --makes sure it's a CEnt (Combat Entity)

			local info = {

				class = entity:GetClass(),

				ang = entity:GetAngles(),

				mdl = entity:GetModel(),

				mat = entity:GetMaterial(),

				col = entity:GetColor(),

				name = entity:GetNetVar("name", entity.PrintName),

				desc = entity:GetNetVar("desc", ""),

				ani = entity:GetSequence(),

				--inv = entity.inv,

				

				--actions = entity.actions,

				

				--hp = entity:getHP(),

				--hpMax = entity:getMaxHP(),

				

				--mp = entity:getMP(),

				--mpMax = entity:getMaxMP(),

				

				--armor = entity.armor,

				

				--dmg = entity.dmg,

				--res = entity:GetNetVar("res"),

				--amp = entity:GetNetVar("amp"),

				

				--attribs = entity.attribs,

			}	

			if entity.curbonegun then 
				info.gun = entity.curbonegun
			end

			client.CEntC = info

			local name = entity:GetNetVar("name", entity.PrintName)

			client:Notify(name.. " has been copied.") --Notify the player

		else --called if they aren't looking at the right thing

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



--clones a target Cent

ix.command.Add("centpaste", {

	adminOnly = true,

	OnRun = function(self, client, arguments)

		local info = client.CEntC

		if(info) then

			local clone = ents.Create(info.class) --the new clone entity

			clone:SetPos(client:GetEyeTrace().HitPos) --set its position

			clone:SetAngles(info.ang) --set its angles

			

			clone:Spawn() --spawn it

			

			clone:SetModel(info.mdl) --set its model

			clone:SetMaterial(info.mat) --set its material

			clone:SetColor(info.col)

			

			--sets its animation

			timer.Simple(1, function()

				if(IsValid(clone)) then

					clone:ResetSequence(info.ani)

				end

			end)

			

			clone:SetNetVar("name", info.name) --set its custom name

			clone:SetNetVar("desc", info.desc) --set its description		
			
			if info.gun then 
				local ent = ents.Create("prop_physics")
				ent:SetPos(clone:GetPos() + Vector(0,0,60))
				ent:SetModel(info.gun)
				ent:Spawn()
				ent:Activate()

				--local ent = self:GetSelectedEntity()
				timer.Simple(0.01, function()
					local newEntity = rb655_ApplyBonemerge( ent, clone )

					undo.Create( "bonemerge" )
						undo.AddEntity( newEntity )
						undo.SetPlayer( client )
					undo.Finish()
				end)
			end

			

			--clone.inv = info.inv



			--clone.armor = info.armor

			

			--clone:SetNetVar("hp", info.hp)

			--clone:SetNetVar("hpMax", info.hpMax)

			

			--clone:SetNetVar("mp", info.mp)

			--clone:SetNetVar("mpMax", info.mpMax)

			

			--clone.actions = info.actions

			--clone.dmg = info.dmg

			--clone.res = info.res

			--clone.amp = info.amp

			

			--set its attributes

			--clone.attribs = info.attribs

			

			clone:SetCreator(client) --prop protection



			local name = clone:GetNetVar("name", clone.PrintName)

			client:Notify(name.. " has been pasted.") --Notify the player

		end

	end

})



ix.command.Add("centfollow", {

	adminOnly = true,

	syntax = "<string target>",

	OnRun = function(self, client, arguments)	

		local entity = client:GetEyeTrace().Entity

		if !(IsValid(entity) and entity.combat) then

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



ix.command.Add("centconfig", {

	adminOnly = true,

	OnRun = function(self, client, arguments)	

		local entity = client:GetEyeTrace().Entity

		if (IsValid(entity) and entity.combat) then

			PLUGIN:CEnt_config(client, entity)

		else

			client:Notify("You must be looking at a combat entity.")

		end

	end

})



ix.chat.Register("say_npc", {

    format = "%s says \"%s\"",

    indicator = "chatTalking",

	onChatAdd = function(speaker, text)

		local color = ix.config.Get("chatColor")

		

		chat.AddText(Color(color.r, color.g, color.b), text)

	end,

	CanHear = ix.config.Get("chatRange", 280),

	deadCanChat = true

})



ix.chat.Register("whisper_npc", {

	onChatAdd = function(speaker, text)

		local color = ix.config.Get("chatColor")

		

		chat.AddText(Color(color.r - 35, color.g - 35, color.b - 35), text)

	end,

	filter = "actions",

	font = "ixWhisperFont",

	format = "%s whispers \"%s\"",

	CanHear = ix.config.Get("chatRange", 280) * 0.25,

	deadCanChat = true

})



/*

ix.chat.Register("say_npc", {

	onChatAdd = function(speaker, text)

		local color = ix.config.get("chatColor")

		

		chat.AddText(Color(color.r, color.g, color.b), text)

	end,

	filter = "actions",

	font = "ixChatFont",

	onCanHear = ix.config.Get("chatRange", 280),

	deadCanChat = true

})

*/

/*

ix.chat.Register("me_npc", {

    format = "** %s %s",

    -- GetColor = ix.chat.classes.ic.GetColor,

	-- OnChatAdd = function(self, speaker, text, anonymous)

    OnChatAdd = function(self, speaker, text, anonymous)

        if not IsValid(speaker) then return end

        local name = speaker:Name()

        local chatColor = ix.config.Get("chatColor")

        chat.AddText(color_white, "** ", name, chatColor, " ", text)

    end,

    filter = "actions",

	onCanHear = ix.config.Get("chatRange", 280) * 2,

    deadCanChat = true

})

*/

ix.chat.Register("me_npc", {

    onChatAdd = function(self, speaker, text, anonymous)

        if not IsValid(speaker) then return end

        local name = speaker:Name()

        local chatColor = ix.config.Get("chatColor")

        chat.AddText(color_white, "** ", name, chatColor, " ", text)

	end,

	filter = "actions",

    format = "** %s %s",

	CanHear = ix.config.Get("chatRange", 280) * 2,

	deadCanChat = true

})

ix.chat.Register("yell_npc", {

	onChatAdd = function(speaker, text)

		local color = ix.config.Get("chatColor")

		

		chat.AddText(Color(color.r + 35, color.g + 35, color.b + 35), text)

	end,

	filter = "actions",

	format = "%s yells \"%s\"",

	font = "ixYellFont",

	CanHear = ix.config.Get("chatRange", 280) * 2,

	deadCanChat = true

})



if(SERVER) then

	function PLUGIN:CEnt_config(client, entity)

		local config = {

			["name"] = {weight = 1, name = "Name", value = entity:Name()},

			["desc"] = {weight = 2, name = "Description", value = entity:Desc()},		

			--["hp"] = {weight = 3, name = "Health", value = entity:getHP()},

			--["hpMax"] = {weight = 4, name = "Max Health", value = entity:getMaxHP()},

			--["mp"] = {weight = 5, name = "Mana", value = entity:getMP()},

			--["mpMax"] = {weight = 6, name = "Max Mana", value = entity:getMaxMP()},

			--["magic"] = {weight = 7, name = "Magic Bonus", value = entity.magic},

			["model"] = {weight = 3, name = "Model", value = entity:GetModel()},

			--["dmg"] = {weight = 8, name = "Base Damage", value = entity.dmg},

		}

		

		local extra = {}

		extra.attribs = entity.attribs

		--extra.dmgT = entity.dmgT

	

		netstream.Start(client, "CEnt_config", entity, config, extra)

	end

	

	netstream.Hook("CEnt_configF", function(client, entity, data)

		if(data.attribs) then		

			entity.attribs = data.attribs

		end

		

		if(data.name) then

			entity:SetNetVar("name", data.name)

		end

		

		if(data.desc) then

			entity:SetNetVar("desc", data.desc)

		end

		

		if data.model then 

			entity:SetModel(data.model)
			entity:SetNetVar("model", data.model)

		end

	end)

	

else

	netstream.Hook("CEnt_config", function(entity, config, extra)

		local attribs = extra.attribs or {}

		

		local frame = vgui.Create("DFrame")

		frame:SetSize(450, 600)

		frame:Center()

		frame:SetTitle("CEnt Configuration")

		frame:MakePopup()

		frame:ShowCloseButton(true)



		local scroll = vgui.Create("DScrollPanel", frame)

		scroll:Dock(FILL)

		

		local configF = {}

		for k, v in SortedPairsByMemberValue(config, "weight") do

			local label = vgui.Create("DLabel", scroll)

			label:SetText(v.name)

			label:Dock(TOP)



			local entry = vgui.Create("DTextEntry", scroll)

			entry:SetText(v.value or "")

			entry:Dock(TOP)

			

			configF[k] = entry

		end

		/*

		local label = vgui.Create("DLabel", scroll)

		label:SetText("Attributes")

		label:Dock(TOP)

		

		local configA = {}

		for k, v in pairs(ix.attribs.list) do

			local label = vgui.Create("DLabel", scroll)

			label:SetText(v.name)

			label:Dock(TOP)



			local entry = vgui.Create("DNumberWang", scroll)

			entry:SetMax(1000)

			entry:SetValue(attribs[k] or 0)

			entry:Dock(TOP)

			

			configA[k] = entry

		end

		*/

		local finishB = vgui.Create("DButton", scroll)

		finishB:SetSize(60,20)

		finishB:SetText("Complete")

		finishB:Dock(TOP)

		finishB.DoClick = function()

			local data = {}



			for k, v in pairs(configF) do

				data[k] = v:GetText()

			end

			

			data.attribs = {}

			

			netstream.Start("CEnt_configF", entity, data)

			

			frame:Remove()

		end

		

		local cancelB = vgui.Create("DButton", scroll)

		cancelB:SetSize(60,20)

		cancelB:SetText("Cancel")

		cancelB:Dock(TOP)

		cancelB.DoClick = function()

			frame:Remove()

		end

	end)



end



function PLUGIN:CanAutoFormatMessage(client, chatType, message)

	if (chatType == "say_npc" or chatType == "yell_npc" or chatType == "whisper_npc") then

		return true

	end

end
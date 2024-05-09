-- "gamemodes\\halorp\\plugins\\combat\\libs\\sh_centequip.lua"
-- Retrieved by https://github.com/c4fe/glua-steal
local PLUGIN = PLUGIN

ix.command.Add("centequip", {
	adminOnly = true,
	syntax = "<string model>",
	OnRun = function(client, arguments)	
		if(!arguments[1]) then
			client:Notify("No model specified.")
			return false
		end
	
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			entity:EquipWeapon(arguments[1], arguments[2])
			
			client:Notify("CEnt equipped.")
		else
			client:Notify("You must be looking at a combat entity.")
		end
	end
})

ix.command.Add("centequipitem", {
	adminOnly = true,
	OnRun = function(self, client, arguments)		
		local entity = client:GetEyeTrace().Entity
		if (IsValid(entity) and entity.combat) then
			--sends them gui thing
			netstream.Start(client, "ix_centEquipMenu", entity)
		else
			client:Notify("You must be looking at a combat entity.")
		end
	end
})

if(SERVER) then
	netstream.Hook("ix_centEquip", function(client, entity, uniqueID)
		local itemTable = ix.item.list[uniqueID]
		
		if(itemTable) then
			entity:EquipWeapon(itemTable.model, itemTable.material)
		end
	end)
else --CLIENT
--this thing sucks and i hate gui and i'm too lazy to make it not suck
	netstream.Hook("ix_centEquipMenu", function(entity)		
		local frame = vgui.Create("DFrame")
		frame:SetTitle("CEnt Equipment")
		frame:SetSize(120, 100)
		frame:SetPos(ScrW() * 0.5, ScrH() * 0.5)
		frame:MakePopup()
		frame:ShowCloseButton(true)

		local scroll = vgui.Create("DScrollPanel", frame)
		scroll:Dock(FILL)
		
		local itemList = vgui.Create("DComboBox", scroll)
		itemList:SetPos(5, 30)
		itemList:SetSize(100, 20)
		itemList:SetValue("")
		
		for k, item in pairs(ix.item.list) do
			if(item.class) then
				itemList:AddChoice(item.name, item.uniqueID)
			end
		end
		
		itemList.OnSelect = function(self, index, value, uniqueID)
			netstream.Start("ix_centEquip", entity, uniqueID)
		end
	end)
end

ITEM.name = "Skillbook"
ITEM.description = "Something to read"
ITEM.longdesc = ""
ITEM.model = "models/kleiner.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Consumables"
ITEM.hunger = 0
ITEM.quantity = 1
ITEM.skill = "Survival"

function ITEM:GetDescription()
	local quant = self:GetData("quantity", 1)
	local str = self.description
	if self.longdesc then
		str = str.."\n\n"..(self.longdesc or "")
	end

	local customData = self:GetData("custom", {})
	if(customData.desc) then
		str = customData.desc
	end

	if (customData.longdesc) then
		str = str.."\n\n"..customData.longdesc or ""
	end

	if (self.entity) then
		return (self.description)
	else
        return (str)
	end
end

function ITEM:GetName()
	local name = self.name
	
	local customData = self:GetData("custom", {})
	if(customData.name) then
		name = customData.name
	end
	
	return name
end

ITEM.functions.Custom = {
	name = "Customize",
	tip = "Customize this item",
	icon = "icon16/wrench.png",
	OnRun = function(item)		
		ix.plugin.list["customization"]:startCustom(item.player, item)
		
		return false
	end,
	
	OnCanRun = function(item)
		local client = item.player
		return client:GetCharacter():HasFlags("N") and !IsValid(item.entity)
	end
}

ITEM.functions.Inspect = {
	name = "Inspect",
	tip = "Inspect this item",
	icon = "icon16/picture.png",
	OnClick = function(item, test)
		local customData = item:GetData("custom", {})

		local frame = vgui.Create("DFrame")
		frame:SetSize(540, 680)
		frame:SetTitle(item.name)
		frame:MakePopup()
		frame:Center()

		frame.html = frame:Add("DHTML")
		frame.html:Dock(FILL)
		
		local imageCode = [[<img src = "]]..customData.img..[["/>]]
		
		frame.html:SetHTML([[<html><body style="background-color: #000000; color: #282B2D; font-family: 'Book Antiqua', Palatino, 'Palatino Linotype', 'Palatino LT STD', Georgia, serif; font-size 16px; text-align: justify;">]]..imageCode..[[</body></html>]])
	end,
	OnRun = function(item)
		return false
	end,
	OnCanRun = function(item)
		local customData = item:GetData("custom", {})
	
		if(!customData.img) then
			return false
		end
		
		if(item.entity) then
			return false
		end
		
		return true
	end
}

ITEM.functions.Clone = {
	name = "Clone",
	tip = "Clone this item",
	icon = "icon16/wrench.png",
	OnRun = function(item)
		local client = item.player	
	
		client:requestQuery("Are you sure you want to clone this item?", "Clone", function(text)
			if text then
				local inventory = client:GetCharacter():GetInventory()
				
				if(!inventory:Add(item.uniqueID, 1, item.data)) then
					client:Notify("Inventory is full")
				end
			end
		end)
		return false
	end,
	OnCanRun = function(item)
		local client = item.player
		return client:GetCharacter():HasFlags("N") and !IsValid(item.entity)
	end
}

ITEM.functions.use = {
	name = "Read",
	icon = "icon16/book.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "reads their "..item.name..".", false)

		local char = item.player:GetCharacter()

		if (item.skill == "Guns") then 
			local currentlevel = char:GetGuns()
			char:SetGuns(currentlevel + 1)
		end 

		if (item.skill == "EnergyWeapons") then 
			local currentlevel = char:GetEnergyWeapons()
			char:SetEnergyWeapons(currentlevel + 1)
		end 

		if (item.skill == "Melee") then 
			local currentlevel = char:GetMelee()
			char:SetMelee(currentlevel + 1)
		end 

		if (item.skill == "Explosives") then 
			local currentlevel = char:GetExplosives()
			char:SetExplosives(currentlevel + 1)
		end 

		if (item.skill == "Survival") then 
			local currentlevel = char:GetSurvival()
			char:SetSurvival(currentlevel + 1)
		end 

		if (item.skill == "Science") then 
			local currentlevel = char:GetScience()
			char:SetScience(currentlevel + 1)
		end 

		if (item.skill == "Repair") then 
			local currentlevel = char:GetRepair()
			char:SetRepair(currentlevel + 1)
		end 

		if (item.skill == "Medicine") then 
			local currentlevel = char:GetMedicine()
			char:SetMedicine(currentlevel + 1)
		end 

		if (item.skill == "Sneak") then 
			local currentlevel = char:GetSneak()
			char:SetSneak(currentlevel + 1)
		end 

		if (item.skill == "Lockpick") then 
			local currentlevel = char:GetLockpick()
			char:SetLockpick(currentlevel + 1)
		end 

		item.player:NewVegasNotify(item.skill .. " increased by 1.", "messageNeutral", 10)

		quantity = quantity - 1

		if (quantity >= 1) then
			item:SetData("quantity", quantity)
			return false
		end

		return true
	end
}

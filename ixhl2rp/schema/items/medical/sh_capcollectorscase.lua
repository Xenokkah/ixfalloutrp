ITEM.name = "Sunset Sarsaparilla Star Hunter Case"
ITEM.description = "A carrying case for Sunset Sarsaparilla Star Caps."
ITEM.longdesc = "For those across the wasteland who zealously follow the Legend Of The Star, keeping your star caps seperate from your regular spending ones can be a chore. Enter the Star Hunter case, which have foam inserts spoating coin-sized slots on both sides specifically for storing them, making your hunt a less cumbersome experience."
ITEM.model = "models/props_c17/briefcase001a.mdl"
ITEM.width = 2
ITEM.height = 2
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 0
ITEM.weight = 0.05
ITEM.duration = 350

ITEM.functions.addcap = {
	name = "Add Star Caps",
	icon = "icon16/coins_add.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		curplayer = item.player:GetCharacter()
		
		inv = curplayer:GetInventory()
		local addedcaps = 0

		local starcaps = inv:GetItemsByUniqueID("bluestarcap")

		for k, v in pairs (starcaps) do
			addedcaps = addedcaps + 1
			v:Remove(false, true)
		end 

		curplayer:GetPlayer():NewVegasNotify("Added " ..addedcaps.. " Star Cap(s) to collector case.", "messageNeutral", 8)
		curplayer:GetPlayer():EmitSound("fosounds/fix/ui_items_bottlecaps_up_03.mp3" or "items/battery_pickup.wav")
		
		item:SetData("quantity", quantity + addedcaps)


		return false 

	end,

	OnCanRun = function(item)
		curplayer = item.player:GetCharacter()
		if curplayer:GetInventory():HasItem("bluestarcap") then
			return (!IsValid(item.entity))
		else 
			return false
		end 

	end
}

ITEM.functions.takecap = {
	name = "Remove Star Cap",
	icon = "icon16/coins_delete.png",
	sound = "fosounds/fix/ui_items_bottlecaps_up_03.mp3",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		curplayer = item.player:GetCharacter()
		
		inv = curplayer:GetInventory()
		
		curplayer:GetInventory():Add("bluestarcap", 1)
		item:SetData("quantity", quantity - 1)

	
		curplayer:GetPlayer():EmitSound("fosounds/fix/ui_items_bottlecaps_up_03.mp3" or "items/battery_pickup.wav")
		
		item:SetData("quantity", quantity + addedcaps)


		return false 

	end,

	OnCanRun = function(item)
		curplayer = item.player:GetCharacter()
		if item:GetData("quantity", 0) > 0 then
			return (!IsValid(item.entity))
		else 
			return false
		end 

	end
}

ITEM.functions.takecapall = {
	name = "Remove All Star Caps",
	icon = "icon16/coins_delete.png",
	sound = "fosounds/fix/ui_items_bottlecaps_up_03.mp3",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		curplayer = item.player:GetCharacter()
		
		inv = curplayer:GetInventory()
		local removedcaps = 0
		
		while (item:GetData("quantity") > 0) do
			item:SetData("quantity", item:GetData("quantity") - 1)
			curplayer:GetInventory():Add("bluestarcap", 1)
			removedcaps = removedcaps + 1
		end 

		curplayer:GetPlayer():NewVegasNotify("Removed " ..removedcaps.. " Star Cap(s) from the collector case.", "messageNeutral", 8)
		curplayer:GetPlayer():EmitSound("fosounds/fix/ui_items_bottlecaps_up_03.mp3" or "items/battery_pickup.wav")
		
	


		return false 

	end,

	OnCanRun = function(item)
		curplayer = item.player:GetCharacter()
		if item:GetData("quantity", 0) > 0 then
			return (!IsValid(item.entity))
		else 
			return false
		end 

	end
}



function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		local quant = self:GetData("quantity", self.quantity)
		local str = self.longdesc.."\n \nThere are "..quant.." Star Caps stored inside."

		return str
	else
		return self.description
	end
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)
		draw.SimpleText(item:GetData("quantity", item.quantity), "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end
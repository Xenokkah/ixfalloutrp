ITEM.name = "Rad-X"
ITEM.description = "Preventative medicine."
ITEM.longdesc = "A bottle of pills to be taken before entering a radioactive area, to increase the body's natural radiation resistance for a medium period.\n\n+25% Radiation Resistance"
ITEM.model = "models/mosi/fnv/props/health/radx.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.sound = "fosounds/fix/npc_human_using_stimpak.mp3"
ITEM.weight = 0.05
ITEM.duration = 7

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "takes some "..item.name..".", false)

		curplayer = item.player:GetCharacter()
		item.name = item.name
		duration = item.duration
		
		curplayer:SetCharradresistboost(curplayer:GetCharradresistboost() + 25)
		curplayer:SetData("usingRadX", true)

		timer.Create(item.name, item.duration, 1, function() 
			curplayer:SetCharradresistboost(curplayer:GetCharradresistboost() - 25)
			curplayer:GetPlayer():NewVegasNotify(item.name .. " has worn off.", "messageNeutral", 8)
			curplayer:GetPlayer():EmitSound("cwfallout3/ui/medical/wear_off.wav" or "items/battery_pickup.wav")
			curplayer:SetData("usingRadX", false)
		end)

		timer.Pause(item.name)
		local drugtable = curplayer:GetData("timertable") or {}
		table.insert(drugtable, item.name)
		curplayer:SetData("timertable", drugtable)


		quantity = quantity - 1
		if (quantity >= 1) then
			item:SetData("quantity", quantity)
			return false
		end

		return true

	end,

	OnCanRun = function(item)
		curplayer = item.player:GetCharacter()
		
		if (curplayer:GetData("usingRadX")) then 
			return false
		else 
			return (!IsValid(item.entity))
		end 
	end
}


function ITEM:GetDescription()
	if (!self.entity or !IsValid(self.entity)) then
		local quant = self:GetData("quantity", self.quantity)
		local str = self.longdesc.."\n \nThere's only "..quant.." uses left."

		return str
	else
		return self.desc
	end
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText(item:GetData("quantity", item.quantity).."/"..item.quantity, "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end
ITEM.name = "Psycho"
ITEM.description = "A pre-war attempt at a super soldier serum."
ITEM.longdesc = "A pre-war combat drug meant to make soldiers more effective, it effectively immediately and extremely heightens aggression while dampening fear responses, making them a murderous animal that one cannot possibly reason with until its effects pass."
ITEM.model = "models/mosi/fnv/props/health/radx.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.sound = "fosounds/fix/npc_human_using_psycho_01.mp3"
ITEM.weight = 0.05
ITEM.duration = 350

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "injects a dose of "..item.name..".", false)
		item.player:GetCharacter():GetInventory():Add("dirtysyringe", 1)
		item.player:NewVegasNotify("LET'S FUCKING GOOOOOOOO! Ignore all negative statuses, which are applied after drug wears off", "messageAngry", 8)

		curplayer = item.player:GetCharacter()
		itemname = item.name
		duration = item.duration
		

		timer.Simple(duration, function() 
			curplayer:GetPlayer():NewVegasNotify(itemname .. " has worn off.", "messageNeutral", 8)
			curplayer:GetPlayer():EmitSound("cwfallout3/ui/medical/wear_off.wav" or "items/battery_pickup.wav")
		end)

		quantity = quantity - 1
		if (quantity >= 1) then
			item:SetData("quantity", quantity)
			return false
		end

		return true
	end,

	OnCanRun = function(item)
		return (!IsValid(item.entity))
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
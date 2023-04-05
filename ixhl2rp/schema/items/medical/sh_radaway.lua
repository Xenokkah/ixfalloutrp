ITEM.name = "Radaway"
ITEM.description = "Preventative medicine."
ITEM.longdesc = "An IV bag full of fluid. Purges radiation from the body, but causes muscle weakness. Best used while resting."
ITEM.model = "models/mosi/fnv/props/health/radx.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.sound = "items/smallmedkit1.wav"
ITEM.weight = 0.05
ITEM.duration = 400

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "uses a bag of "..item.name..".", false)
		item.player:NewVegasNotify("Being rad-free never felt so good. Radiation purged, but -1 END and STR", "messageNeutral", 8)

		curplayer = item.player:GetCharacter()
		itemname = item.name
		duration = item.duration
		curplayer:AddBoost("radaway", "strength", -1)
		curplayer:AddBoost("radaway", "endurance", -1)
		
		timer.Simple(duration, function() 
			curplayer:RemoveBoost("radaway", "strength")
			curplayer:RemoveBoost("radaway", "endurance")
			curplayer:GetPlayer():NewVegasNotify(itemname .. " has worn off.", "messageNeutral", 8)
			curplayer:GetPlayer():EmitSound("cwfallout3/ui/medical/wear_off.wav" or "items/battery_pickup.wav")
		end)

		quantity = quantity - 1
		if (quantity >= 1) then
			item:SetData("quantity", quantity)
			return false
		end

		return true

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
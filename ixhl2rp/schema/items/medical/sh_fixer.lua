ITEM.name = "Fixer"
ITEM.description = "A tin of pills for treating addiction."
ITEM.longdesc = "A set of tablets to take that immediately suppress any mentally or physically altering side effects from any drugs or alcohol - be they positive or negative. Slightly hazes your vision and causes muscles to remble for a short period, making swinging or firing a weapon effectively quite difficult. In the long term, they can also suppress mental and physical cravings for addictive substances, aiding in recovery."
ITEM.model = "models/mosi/fnv/props/health/chems/fixer.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.sound = "items/smallmedkit1.wav"
ITEM.weight = 0.05
ITEM.duration = 300

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "takes some  "..item.name..".", false)

		local boosts = item.player:GetCharacter():GetBoosts()

		for attribID, v in pairs(boosts) do
			for boostID, _ in pairs(v) do
				item.player:GetCharacter():RemoveBoost(boostID, attribID)
			end
		end

		
		curplayer = item.player:GetCharacter()
		itemname = item.name
		duration = item.duration

		item.player:NewVegasNotify("All stat buffs and debuffs removed, but your vision blurs slightly and your arms tremble.", "messageNeutral", 7)

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
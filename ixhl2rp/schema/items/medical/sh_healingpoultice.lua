ITEM.name = "Healing Poultice"
ITEM.description = "A stronger healing powder."
ITEM.longdesc = "A pouch of ground up herbs, more potent than the more common cousin for healing, but inflict a painful sting that makes movement a bit more difficult for a period. \n\n+50 HP\n-1 AGI\nSurvival DC to Stabilize: 15"
ITEM.model = "models/mosi/fnv/props/health/healingpowder.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.heal = 50
ITEM.quantity = 1
ITEM.sound = "fosounds/fix/npc_human_using_stimpak.mp3"
ITEM.weight = 0.05
ITEM.duration = 5

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "applies their "..item.name..".", false)
		item.player:AdjustHealth("heal", item.heal)
		item.player:NewVegasNotify("Restored " .. item.heal .. " health.", "messageNeutral", 4)

		curplayer = item.player:GetCharacter()
		item.name = item.name
		duration = item.duration

		curplayer:BuffStat("poulticepain", "agility", -1)
		curplayer:SetData("usingHealingpoultice", true)

		timer.Create(item.name, item.duration, 1, function() 
			curplayer:RemoveBuff("poulticepain", "agility")
			curplayer:GetPlayer():NewVegasNotify(item.name .. " has worn off.", "messageNeutral", 8)
			curplayer:GetPlayer():EmitSound("cwfallout3/ui/medical/wear_off.wav" or "items/battery_pickup.wav")
			curplayer:SetData("usingHealingpoultice", true)
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
		if (curplayer:GetData("usingHealingpoultice")) then 
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
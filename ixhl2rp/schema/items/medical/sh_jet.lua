ITEM.name = "Jet"
ITEM.description = "An amphetamine in an inhaler."
ITEM.longdesc = "An inhaler full of brahmin dung and other chemicals, it is arguably the Wasteland's most infamous and widespread drug. When inhaled, the user feels energized and euphoric, but only for a short period of mere minutes before it ends, often leaving them wanting more.."
ITEM.model = "models/mosi/fnv/props/health/chems/jet.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.sound = "fosounds/fix/npc_human_using_jet.mp3"
ITEM.weight = 0.05
ITEM.duration = 160

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "huffs some "..item.name..".", false)

		item.player:NewVegasNotify("You feel SO READY! +2 sec movement", "messageVeryHappy", 8)

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
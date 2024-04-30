ITEM.name = "Automatic Robot Repair Tool"
ITEM.description = "A disposable welding tool for bot repair."
ITEM.longdesc = "A small-capacity welding tool for closing breaches in metal quickly, used for repairing damaged bots. This one can be strapped to a robot, and its sensors will automatically detect and repair structural damage.\n\n+45 HP\nUsable by Robots only\nNo AP cost to use"
ITEM.model = "models/mosi/fallout4/props/aid/robotrepair.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.heal = 45
ITEM.sound = "fosounds/fix/npc_human_using_stimpak.mp3"
ITEM.weight = 0.05

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "uses their "..item.name..".", false)

		item.player:AdjustHealth("heal", item.heal)
		item.player:NewVegasNotify("Restored " .. item.heal .. " health.", "messageNeutral", 4)

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
		return self.description
	end
end

if (CLIENT) then
	function ITEM:PaintOver(item, w, h)

		draw.SimpleText(item:GetData("quantity", item.quantity).."/"..item.quantity, "DermaDefault", 3, h - 1, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, color_black)
	end
end
ITEM.name = "Bobby Pin Box"
ITEM.description = "A wooden box of bobby pins."
ITEM.longdesc = "A box of bobby pins, origonally meant for pinning hair in place or similar daily tasks. More often, it's used as a makeshift lockpick for mechanical locks."
ITEM.model = "models/mosi/fallout4/props/junk/bobbypinbox.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 5
ITEM.weight = 0.05
ITEM.duration = 9000

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/key.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "uses a bobby pin from their "..item.name..".", false)

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
		local str = self.longdesc.."\n \nThere are "..quant.." bobby pins stored inside."

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
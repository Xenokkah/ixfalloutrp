ITEM.name = "Case of Surgical Tools"
ITEM.description = "A set of surgical tools in a marked metal box."
ITEM.longdesc = "A metal case containing a few sets of surgical tools, still wrapped in sterile packaging.\nUsed to treat long term injuries by experienced doctors, curing or alleviating them."
ITEM.model = "models/mccarran/medbay/firstaidkit01.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 2
ITEM.weight = 0.05
ITEM.duration = 9000

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/key.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "uses a sterile tool set from their "..item.name..".", false)

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
		local str = self.longdesc.."\n \nThere are "..quant.." sterile tool sets stored inside."

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
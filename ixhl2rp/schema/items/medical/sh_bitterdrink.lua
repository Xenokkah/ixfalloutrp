ITEM.name = "Bitter Drink"
ITEM.description = "An uncommonly seen tribal curative."
ITEM.longdesc = "With a special process invented by the Twin Mothers tribe, common herbs can be prepared in a way that provides almost immediate pain relief with only a bitter taste. More commonly carried by Caesar's Legion, who adopted the recipe after wiping out Twin Mothers."
ITEM.model = "models/mosi/fnv/props/health/antivenom.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
ITEM.weight = 0.05



ITEM.functions.use = {
	name = "Use",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "drinks their "..item.name..".", false)

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
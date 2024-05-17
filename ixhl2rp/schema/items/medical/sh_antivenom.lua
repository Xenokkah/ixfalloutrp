ITEM.name = "Antivenom"
ITEM.description = "A venom treatment."
ITEM.longdesc = "A clay bottle full of general antivenom, known to counter almost all animal-borne toxins from the body in short order. Valued by basically anybody due to the high prevalence of aggressive, venomous creatures."
ITEM.model = "models/mosi/fnv/props/health/antivenom.mdl"
ITEM.width = 1
ITEM.height = 2
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.sound = "fosounds/fix/npc_human_using_stimpak.mp3"
ITEM.weight = 0.05
ITEM.duration = 9000

ITEM.functions.use = {
	name = "Use",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
	
		ix.chat.Send(item.player, "iteminternal", "takes some "..item.name..".", false)
		item.player:NewVegasNotify("Animal venom effects removed.", "messageNeutral", 8)
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
ITEM.name = "Hydra"
ITEM.description = "A pain-killing mixture."
ITEM.longdesc = "A soda bottle with three seperate glass vials leading to its mouth via tube, hence the name. Provides effective pain relief over time. Despite having some addictive properties, the Legion does not consider it a banned drug and often issues it to its soldiers - but it's equally valued by anybody else without the luxury of Med-X access."
ITEM.model = "models/mosi/fnv/props/health/chems/hydra.mdl"
ITEM.width = 1
ITEM.height = 2
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
	
		ix.chat.Send(item.player, "iteminternal", "injects some "..item.name..".", false)
		item.player:NewVegasNotify("Phew, much better. Stun, stagger, and limb damage status effect(s) removed at a rate of one per turn.", "messageNeutral", 8)
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
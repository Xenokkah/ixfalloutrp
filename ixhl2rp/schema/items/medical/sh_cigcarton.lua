ITEM.name = "Cigarette Carton"
ITEM.description = "A carton of smokes."
ITEM.longdesc = "A carton of Grey Tortise cigarette packs, the West's premier brand before the war. Few are completely untouched in the years since due to their continued popularity, and tend to produce between 2-5 packs."
ITEM.model = "models/mosi/fallout4/props/junk/cigarettecarton.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.category = "Medical"
ITEM.price = "4000"
ITEM.flag = "1"
ITEM.quantity = 1
ITEM.sound = "fosounds/fix/ui_items_generic_up_02.mp3"
ITEM.weight = 0.05


ITEM.functions.use = {
	name = "Open",
	icon = "icon16/heart.png",
	OnRun = function(item)
		local quantity = item:GetData("quantity", item.quantity)
		ix.chat.Send(item.player, "iteminternal", "opens up a "..item.name..".", false)
		curplayer = item.player:GetCharacter()
		
		-- Give player between 2-5 cig packs.

		local numcigs = math.random(2, 5)
		curplayer:GetInventory():Add("cigpack", numcigs)

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
		return  self.longdesc
	else
		return self.description
	end
end

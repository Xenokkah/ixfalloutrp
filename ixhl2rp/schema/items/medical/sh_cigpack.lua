ITEM.name = "Pack of Cigarettes"
ITEM.description = "A pack of smokes."
ITEM.longdesc = "A pack of Grey Tortise cigarettes, the West's premier brand before the war. Few are completely untouched in the years since due to their continuing popularity, and tend to produce between 1-3 smokes. If you're lucky, maybe you'll find a Lucky Cigarette!"
ITEM.model = "models/mosi/fallout4/props/junk/cigarettepack.mdl"
ITEM.width = 1
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
		
		-- Give player between 1-3 cigs. Get number between 1 and 100, if it's greater than 75 give a 'lucky' cigarette. Add player luck (up to 10%) to give a greater chance at one.

		local numcigs = math.random(1, 3)
		curplayer:GetInventory():Add("cigarette", numcigs)

		local playerluck = curplayer:GetAttribute("luck") 
		local luckycigchance = math.random (1, 100)
		luckycigchance = luckycigchance + playerluck

		if luckycigchance >= 75 then
			curplayer:GetInventory():Add("cigarettelucky", 1)
			curplayer:GetPlayer():NewVegasNotify("Lucky! You find an extra cigarette in the pack!", "messageNeutral", 4)
		end 





		


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

ITEM.name = "Empty Bottle"
ITEM.model = "models/mosi/fnv/props/drink/nukacola_empty.mdl"
ITEM.description = "An empty glass bottle, ready for another use as a liquid storage vessel."
ITEM.category = "junk"
ITEM.flag = "1"
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2

ITEM.functions.fill = {
	name = "Fill Bottle",
	icon = "icon16/drink.png",
	OnRun = function(item)
		curplayer = item.player:GetCharacter()
		inv = curplayer:GetInventory()
		inv:Add("waterclean", 1)
		return true

	end,

	OnCanRun = function(item)
		curplayer = item.player
		if curplayer:WaterLevel() > 0 then
			return (!IsValid(item.entity))
		else 
			return false
		end 

	end
}
ITEM.name = "Headlamp"
ITEM.model = "models/maxofs2d/lamp_flashlight.mdl"
ITEM.width = 1
ITEM.height = 1
ITEM.description = "A standard headmounted flashlight that can be toggled."
ITEM.category = "Electronics"
ITEM.flag = "1"
ITEM.price = 2000
ITEM.repairCost = ITEM.price/100*1
ITEM.weight = 0.25

ITEM:Hook("drop", function(item)
	item.player:Flashlight(false)
end)



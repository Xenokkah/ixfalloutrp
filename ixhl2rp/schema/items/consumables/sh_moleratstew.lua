ITEM.name = "Mole Rat Stew"
ITEM.model = "models/mosi/fnv/props/food/ratstew.mdl"
ITEM.hunger = 38
ITEM.description = "A stew made from mole rat."
ITEM.longdesc = "A stew made with mole rat meat, beer, and some veggies, overall fairly appealing and filling in equal measure."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 2
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(5)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
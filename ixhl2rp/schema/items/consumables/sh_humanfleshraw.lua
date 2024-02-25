ITEM.name = "Raw Human Flesh"
ITEM.model = "models/mosi/fnv/props/food/humanflesh.mdl"
ITEM.hunger = 5
ITEM.description = "Raw human flesh."
ITEM.longdesc = "Meat ripped from a human being, hopefully not while they were still alive. Unsafe to eat raw like this."
ITEM.quantity = 1
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(5)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
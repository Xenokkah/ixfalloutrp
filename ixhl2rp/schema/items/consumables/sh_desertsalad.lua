ITEM.name = "Desert Salad"
ITEM.model = "models/fnv/clutter/food/desertsalad.mdl"
ITEM.hunger = 40
ITEM.thirst = 40
ITEM.description = "A delicious meal prepared from meat and fruit."
ITEM.longdesc = "A bowl full of a salad made from greens, barrel fruit, meat, and pinyon nuts. Filling and appealing."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 2
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()

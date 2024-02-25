ITEM.name = "Apple"
ITEM.model = "models/mosi/fnv/props/food/crops/apple01.mdl"
ITEM.hunger = 8
ITEM.description = "A fresh apple."
ITEM.longdesc = "Crunchy and delicious, a nice apple is useful for both a snack and cooking."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 1
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
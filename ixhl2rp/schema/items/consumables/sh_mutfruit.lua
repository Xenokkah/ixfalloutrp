ITEM.name = "Mutfruit"
ITEM.model = "models/mosi/fnv/props/food/crops/mutfruit02.mdl"
ITEM.hunger = 5
ITEM.description = "A wasteland berry."
ITEM.longdesc = "A creation of mutated fruits, the Mutfruit is a sort of grape/cherry mix with a strong, tart taste. Often used in cooking."
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
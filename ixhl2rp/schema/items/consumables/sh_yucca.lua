ITEM.name = "Bananna Yucca Fruit"
ITEM.model = "models/mosi/fnv/props/bananayucca.mdl"
ITEM.hunger = 5
ITEM.description = "A piece of sweet fruit."
ITEM.longdesc = "A piece of tasty fruit that has a distinct bananna-y taste when eaten."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 1
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	item.player:addRadiation(5)
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
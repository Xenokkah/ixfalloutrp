ITEM.name = "Fancy Lad's Snack Cakes"
ITEM.model = "models/fnv/clutter/junk/fancyladssnackcakes.mdl"
ITEM.hunger = 10
ITEM.description = "A box of snack cakes."
ITEM.longdesc = "Still fluffy snack cakes filled with a cream imitation. A delight of many sweet and pastry lovers all over."
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
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
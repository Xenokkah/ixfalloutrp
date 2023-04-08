ITEM.name = "Dandy Boy Apples"
ITEM.model = "models/fnv/clutter/junk/dandyboyapples.mdl"
ITEM.hunger = 10
ITEM.description = "A box of sweet apple slices."
ITEM.longdesc = "Once a common sight in a child's lunchbox, these sickeningly sweet apple slices aren't the worst snack item to choose from, if not very filling."
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
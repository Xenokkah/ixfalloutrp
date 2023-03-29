ITEM.name = "Beer"
ITEM.model = "models/fnv/clutter/food/beerbottle01.mdl"
ITEM.thirst = 15
ITEM.description = "A bottle of beer."
ITEM.longdesc = "A mainstay at just about any bar, good old fashioned beer, brewed from hops. What else is there to say that most of humanity's entire history already hasn't?"
ITEM.quantity = 1
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.sound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
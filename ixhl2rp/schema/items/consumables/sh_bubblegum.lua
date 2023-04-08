ITEM.name = "Bubblegum"
ITEM.model = "models/fnv/clutter/junk/bubblegum.mdl"
ITEM.hunger = 5
ITEM.description = "A box of bubblegum."
ITEM.longdesc = "Solidifed, near rock-solid bubblegum pieces. Something to keep your mouth busy, but nothing but empty calories."
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
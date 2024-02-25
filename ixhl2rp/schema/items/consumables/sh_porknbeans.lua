ITEM.name = "Pork n' Beans"
ITEM.model = "models/fnv/clutter/junk/porknbeans.mdl"
ITEM.hunger = 20
ITEM.description = "A can of beans with chunks of pig fat."
ITEM.longdesc = "A favorite and often at a low cost, the beans and chunks of pig fat will give you all you need for a filling meal."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 1
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
ITEM.name = "MRE"
ITEM.model = "models/mosi/fnv/props/food/mre.mdl"
ITEM.hunger = 60
ITEM.description = "A sealed Meal, Ready to Eat."
ITEM.longdesc = "Often found among military or survivalist caches, the amount of preserves packed into this thing will provide a filling, if somewhat lacking in taste, meal. Includes flameless ration heater for cooking."
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
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
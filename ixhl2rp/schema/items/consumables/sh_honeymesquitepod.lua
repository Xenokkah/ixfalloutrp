ITEM.name = "Honey Mesquite Pod"
ITEM.model = "models/mosi/fnv/props/food/crops/honeymesquite.mdl"
ITEM.hunger = 5
ITEM.description = "A pod of Honey Mesquite seeds."
ITEM.longdesc = "A simple pod of seeds from the Honey Mesquite plan. Edible by humans as a minor snack, but often used for other recipes."
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
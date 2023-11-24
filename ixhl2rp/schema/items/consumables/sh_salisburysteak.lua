ITEM.name = "Salisbury Steak"
ITEM.model = "models/fnv/clutter/food/steakbox01.mdl"
ITEM.hunger = 20
ITEM.description = "A boxed salisbury steak meal."
ITEM.longdesc = "A mush of ground beef, bread crumbs, onion, eggs, and gravy. It's something of a full meal, even with its unusual texture."
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
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
ITEM.name = "Raw Mole Rat Meat"
ITEM.model = "models/mosi/fnv/props/food/molemeatsteak.mdl"
ITEM.hunger = 8
ITEM.description = "A chunk of uncooked mole rat."
ITEM.longdesc = "Meat taken from a mole rat. Quite fatty, once you cook it properly."
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
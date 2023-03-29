ITEM.name = "Pear"
ITEM.model = "models/mosi/fnv/props/food/crops/pear.mdl"
ITEM.hunger = 5
ITEM.description = "A pear."
ITEM.longdesc = "Pretty much entirely unchanged from before the war, the pear is not the most popular fruit to grow but has its uses and unique taste anyway."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 1
ITEM.height = 1
ITEM.sound = "npc/barnacle/barnacle_crunch2.wav"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
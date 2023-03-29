ITEM.name = "Raw Gecko Meat"
ITEM.model = "models/mosi/fnv/props/food/geckosteak.mdl"
ITEM.hunger = 5
ITEM.description = "A chunk of Gecko filet, uncooked."
ITEM.longdesc = "A chunk of Gecko meat, taken from any of its numerous subspecies. Needs to be cooked."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 2
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
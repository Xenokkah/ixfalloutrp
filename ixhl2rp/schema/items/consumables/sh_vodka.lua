ITEM.name = "Vodka"
ITEM.model = "models/fnv/clutter/food/vodka01.mdl"
ITEM.thirst = 18
ITEM.description = "A bottle of Vodka."
ITEM.longdesc = "A bottle of Red Star brand vodka. Was especially popular in the Soviet Union before the war, and has its fans today - especially as a mixer."
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
ITEM.name = "Purified Water"
ITEM.model = "models/fnv/clutter/food/waterpurified01.mdl"
ITEM.thirst = 20
ITEM.description = "A plastic bottle of clean water."
ITEM.longdesc = "A plastic bottle full of water collected from either an uncontaminated source, or dirty water that's been throughly purified. Both completely safe, and very refreshing."
ITEM.quantity = 1
ITEM.price = 5
ITEM.width = 1
ITEM.height = 1
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
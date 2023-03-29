ITEM.name = "Sugar Bombs"
ITEM.model = "models/mosi/fnv/props/food/sugarbombs.mdl"
ITEM.hunger = 10
ITEM.description = "A box of a sugary breakfast cereal."
ITEM.longdesc = "While enough to satisfy a sweet tooth, Sugar Bombs are almost entirely empty calories. Still has its fans."
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
ITEM.name = "Strange Meat Pie"
ITEM.model = "models/mosi/fnv/props/food/strangemeatpie.mdl"
ITEM.hunger = 25
ITEM.description = "A meat pie."
ITEM.longdesc = "A flaky meat pie. The meat in question looks like pork, but tastes like chicken."
ITEM.quantity = 2
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
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
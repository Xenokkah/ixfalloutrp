ITEM.name = "Nuka Cola Quartz"
ITEM.model = "models/fnv/clutter/junk/nv/nvnukacolaquartz.mdl"
ITEM.thirst = 25
ITEM.description = "A bottle of Nuka Cola Quartz."
ITEM.longdesc = "A warm, sealed bottle of Nuka Cola Quartz, a 'clear' flavor that tastes effectively the same, but with even more caffeine. Used to be advertised as a 'healthy' alternative to the main flavor."
ITEM.quantity = 1
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.sound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:GetCharacter():GiveMoney(1)
	item.player:NewVegasNotify("You add the bottle cap to your stash.", "messageNeutral", 8)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
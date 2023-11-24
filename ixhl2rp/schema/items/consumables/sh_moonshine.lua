ITEM.name = "Moonshine"
ITEM.model = "models/mosi/fnv/props/drink/alcohol/moonshine.mdl"
ITEM.thirst = 18
ITEM.description = "A jug of homemade 'shine."
ITEM.longdesc = "A chubby chug full of moonshine brewed in a still somewhere. Smells like disinfectant, tastes like a shotgun to the chest, and might kill you. It's probably worth it."
ITEM.quantity = 3
ITEM.price = 5
ITEM.width = 1
ITEM.height = 3
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(-15)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
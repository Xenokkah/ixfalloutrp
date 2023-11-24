ITEM.name = "Absinthe"
ITEM.model = "models/fnv/clutter/nvabsinthebottle/nvabsinthebottle.mdl"
ITEM.thirst = 18
ITEM.description = "A cautic green liquid, which a handmade label claims is Absinthe."
ITEM.longdesc = "Absinthe was often blamed before the war for being incredibly addictive and intoxicating, but these reports were largely exaggerated. This homemade stuff, however, is probably right on the mark."
ITEM.quantity = 2
ITEM.price = 5
ITEM.width = 1
ITEM.height = 3
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(-10)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
ITEM.name = "Beer"
ITEM.model = "models/mosi/fallout4/props/alcohol/beer.mdl"
ITEM.thirst = 15
ITEM.description = "A bottle of beer."
ITEM.longdesc = "A mainstay at just about any bar, good old fashioned beer, brewed from hops. What else is there to say that most of humanity's entire history already hasn't?"
ITEM.quantity = 1
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	item.player:addRadiation(-3)
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
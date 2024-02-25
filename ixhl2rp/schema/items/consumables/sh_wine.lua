ITEM.name = "Wine"
ITEM.model = "models/fnv/clutter/food/winebottle01.mdl"
ITEM.thirst = 18
ITEM.description = "A bottle of red wine."
ITEM.longdesc = "A tall bottle of some form of red wine, its label long worn off. Often drank to celebrate, or all the time by the most pretentious people of the wastes."
ITEM.quantity = 3
ITEM.price = 5
ITEM.width = 1
ITEM.height = 3
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
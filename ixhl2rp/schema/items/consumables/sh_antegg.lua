ITEM.name = "Ant Egg"
ITEM.model = "models/mosi/fnv/props/food/antegg.mdl"
ITEM.hunger = 10
ITEM.description = "An ant's egg."
ITEM.longdesc = "An ant's egg, taken either from a nest or from an ant themself. Highly radioactive when raw; eating is not advised."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 3
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	item.player:addRadiation(50)
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()

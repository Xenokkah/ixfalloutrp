ITEM.name = "Raw Mirelurk Meat"
ITEM.model = "models/mosi/fnv/props/food/mirelurkmeat.mdl"
ITEM.hunger = 10
ITEM.description = "Uncooked seafood."
ITEM.longdesc = "Mirelurk meat, in the form of meat to be extracted from its claws. Not advisable to eat raw."
ITEM.quantity = 2
ITEM.price = 5
ITEM.width = 2
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(15)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
ITEM.name = "Raw Fish Filet"
ITEM.model = "models/mosi/fnv/props/food/geckosteak.mdl"
ITEM.hunger = 5
ITEM.description = "A piece of raw fish meat."
ITEM.longdesc = "An uncooked filet carved from a mutated fish. Eating this raw would be a very bad idea."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 2
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
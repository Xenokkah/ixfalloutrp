ITEM.name = "Jalapeno Pepper"
ITEM.model = "models/fnv/landscape/plants/nvjalapenopepper.mdl"
ITEM.hunger = 4
ITEM.description = "A spicy pepper."
ITEM.longdesc = "A green pepper known for its spicyness. You can eat it alone, if you're brave, but it's often added to other creations for spice."
ITEM.quantity = 1
ITEM.price = 5
ITEM.width = 1
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
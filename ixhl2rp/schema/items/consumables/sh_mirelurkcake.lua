ITEM.name = "Mirelurk Cake"
ITEM.model = "models/mosi/fnv/props/food/mirelurkcake.mdl"
ITEM.hunger = 25
ITEM.description = "A seafood pastry."
ITEM.longdesc = "A delightful, flaky pastry full of mirelurk meat. Space efficent and tasty."
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
ITEM.name = "Ant Bits"
ITEM.model = "models/mosi/fnv/props/food/antbits.mdl"
ITEM.hunger = 35
ITEM.description = "A bowl of fried ant chunks."
ITEM.longdesc = "A portion of crunchy fried ant bits prepared by someone with culinary skill. Actually pretty good."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 1
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	item.player:addRadiation(5)
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
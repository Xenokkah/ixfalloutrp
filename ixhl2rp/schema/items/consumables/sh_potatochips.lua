ITEM.name = "Potato Chips"
ITEM.model = "models/fnv/clutter/junk/potatocrisps.mdl"
ITEM.hunger = 10
ITEM.description = "A box of crunchy chips, plain flavor."
ITEM.longdesc = "Some boxed potato chips, plain. Fills the craving for salty foods, but not a very healthy meal."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 1
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(5)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
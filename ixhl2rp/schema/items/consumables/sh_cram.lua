ITEM.name = "Cram"
ITEM.model = "models/fnv/clutter/junk/cram01.mdl"
ITEM.hunger = 15
ITEM.description = "A blue tin can of Cram."
ITEM.longdesc = "Salty, preserved meat served from a distinctive blue tin. You tend to either love it or hate it."
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
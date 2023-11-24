ITEM.name = "Raw Ant Meat"
ITEM.model = "models/fnv/clutter/food/dogmeat01.mdl"
ITEM.hunger = 10
ITEM.description = "A chunk of uncooked giant ant."
ITEM.longdesc = "Meat taken from a giant ant, specifically its thorax. Not a very tasty meal, especially uncooked like this, but high in protein."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 3
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	item.player:addRadiation(10)
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
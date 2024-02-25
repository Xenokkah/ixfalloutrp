ITEM.name = "Raw Brahmin Meat"
ITEM.model = "models/mosi/fnv/props/food/yoaguaimeat.mdl"
ITEM.hunger = 5
ITEM.description = "A chunk of Brahmin meat, uncooked."
ITEM.longdesc = "A chunk of what is effectively uncooked beef. While delicious when cooked, eating it raw is a very bad idea."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 2
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	item.player:addRadiation(15)
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
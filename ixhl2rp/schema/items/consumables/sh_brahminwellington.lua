ITEM.name = "Brahmin Wellington"
ITEM.model = "models/mosi/fallout4/props/food/deathclawsouffle.mdl"
ITEM.hunger = 80
ITEM.description = "An exquisite baked dish."
ITEM.longdesc = "Brahmin steak wrapped in dough and baked until crisp. Rare, expensive, and delicious."
ITEM.quantity = 1
ITEM.price = 80
ITEM.width = 3
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()

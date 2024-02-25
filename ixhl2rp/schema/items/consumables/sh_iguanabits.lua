ITEM.name = "Iguana Bits"
ITEM.model = "models/mosi/fnv/props/food/iguanabits.mdl"
ITEM.hunger = 15
ITEM.description = "Roasted iguana bits on a kebab."
ITEM.longdesc = "Despite a myserious lack of iguanas, there always appears to be these savory snacks hawked by every other street vendor."
ITEM.quantity = 1
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(5)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
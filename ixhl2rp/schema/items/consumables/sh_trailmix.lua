ITEM.name = "Trail Mix"
ITEM.model = "models/mosi/fnv/props/junk/lunchbox.mdl"
ITEM.hunger = 40
ITEM.description = "A lunchbox packed with lots of crunchy delights."
ITEM.longdesc = "Trail mix is a cheaper, less filling alternative to a caravan lunch. On the plus side, it can be assembled almost entirely from natural ingredients."
ITEM.quantity = 1
ITEM.price = 15
ITEM.width = 2
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(20)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()

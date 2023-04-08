ITEM.name = "Wasteland Smoothie"
ITEM.model = "models/mosi/fnv/props/drink/boatfly_smoothie.mdl"
ITEM.thirst = 30
ITEM.hunger = 30
ITEM.description = "A delicious fruit smoothie."
ITEM.longdesc = "Made with milk and various fruits and poured into a tin can, the Wasteland Smoothie is a delicacy that fills hunger pangs and delights the soul. Drink up!"
ITEM.quantity = 2
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
ITEM.name = "Nevada Agave Fruit"
ITEM.model = "models/mosi/fnv/props/food/crops/nevadaagave.mdl"
ITEM.hunger = 8
ITEM.description = "A citrusy desert fruit."
ITEM.longdesc = "Despite its thorny appearence, Agave is actually a quite juicy fruit and sought over for both being an easy desert snack and in cooking."
ITEM.quantity = 1
ITEM.price = 20
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
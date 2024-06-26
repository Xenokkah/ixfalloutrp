ITEM.name = "Caravan Lunch"
ITEM.model = "models/mosi/fnv/props/food/lunchbox_meal.mdl"
ITEM.hunger = 52
ITEM.description = "A lunchbox with pre-war food inside."
ITEM.longdesc = "Packed with common boxed food items, the Caravan Lunch is so-named due to its popularity among caravaneers due to being relatively cheap, but filling."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 2
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(20)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
	item.player:GetCharacter():GetInventory():Add("lunchbox", 1)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
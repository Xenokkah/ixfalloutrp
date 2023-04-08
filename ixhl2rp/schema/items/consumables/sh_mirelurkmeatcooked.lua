ITEM.name = "Steamed Mirelurk"
ITEM.model = "models/mosi/fnv/props/food/steamedmirelurk.mdl"
ITEM.hunger = 25
ITEM.description = "Tasty seafood."
ITEM.longdesc = "Mirelurk meat, in the form of meat to be extracted from its claws. Crack it open and enjoy. Taste like crab, walk like people.."
ITEM.quantity = 2
ITEM.price = 5
ITEM.width = 2
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
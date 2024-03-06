ITEM.name = "Buzz Bites"
ITEM.model = "models/mosi/fallout4/props/food/slocumsbuzzbites.mdl"
ITEM.hunger = 10
ITEM.description = "A box of donut bites full of piping hot coffee."
ITEM.longdesc = "Sugary fried donuts full of hot coffee, a tasty but outright dangerous snack. The coffee is almost guranteed to burn you when you bite in, which is bound to hurt, but will also wake you right up without the sluggishness.\n+2 INT\n-5 HP"
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 1
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)

	curplayer = item.player:GetCharacter()

	item.player:AdjustHealth("hurt", 5)
	curplayer:AddBoost("blackcoffee", "intelligence", 2)


	timer.Simple(175, function() 
		curplayer:RemoveBoost("blackcoffee", "intelligence")
	end)

end)
ITEM.weight = 0.1


ITEM:DecideFunction()
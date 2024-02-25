ITEM.name = "Boost Test"
ITEM.model = "models/fnv/clutter/junk/sodabottleclosed01.mdl"
ITEM.thirst = 20
ITEM.description = "A bottle of Nuka Cola."
ITEM.longdesc = "A warm, sealed bottle of Nuka Cola, an American treasure. Fairly refreshing, and adored by many."
ITEM.quantity = 2
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
ITEM.quantity = 2
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:GetCharacter():GiveMoney(1)
	item.player:NewVegasNotify("You add the bottle cap to your stash.", "messageNeutral", 8)


	curplayer = item.player:GetCharacter()
	curplayer:AddBoost("endboost", "end", -5)
	print(curplayer:GetAttribute("end"))

	timer.Simple(10, function() 
			
		
		curplayer:RemoveBoost("endboost", "end")
		print(curplayer:GetAttribute("end"))
		
	end)

	
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
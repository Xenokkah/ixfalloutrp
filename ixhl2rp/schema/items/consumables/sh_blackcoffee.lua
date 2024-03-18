ITEM.name = "Black Coffee"
ITEM.model = "models/mosi/fnv/props/junk/coffeemug.mdl"
ITEM.thirst = 25
ITEM.description = "A nice cup of coffee."
ITEM.longdesc = "A mug of black coffee, strong java that promotes mindfulness but can make one a tad sluggish.\n+2 INT\n-1 AGI"
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 1
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "drinks their "..item.name..".", false)

	curplayer = item.player:GetCharacter()
	curplayer:BuffStat("blackcoffee", "intelligence", 2)
	curplayer:BuffStat("blackcoffee", "agility", -1)
	item.player:GetCharacter():GetInventory():Add("coffeecup", 1)

	timer.Simple(175, function() 
		curplayer:RemoveBuff("blackcoffee", "intelligence")
		curplayer:RemoveBuff("blackcoffee", "agility")
	end)


end)
ITEM.weight = 0.1


ITEM:DecideFunction()
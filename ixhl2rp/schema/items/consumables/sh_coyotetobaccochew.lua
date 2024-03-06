ITEM.name = "Coyote Tobacco Chew"
ITEM.model = "models/mosi/fnv/props/coyotetobacco.mdl"
ITEM.hunger = 5
ITEM.description = "A few tobacco leaves."
ITEM.longdesc = "Coyote Tobacco grows across the western deserts, which can have invigorating effects either when eaten as-is for a rather short duration or in smokables.. just be careful about getting addicted.\n+1 PER\n+1 AGI"
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 1
ITEM.height = 1
ITEM.sound = "fosounds/fix/npc_human_eating_food_chewy_02.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "chews their "..item.name..".", false)

	curplayer = item.player:GetCharacter()
	curplayer:AddBoost("chew", "perception", 1)
	curplayer:AddBoost("chew", "agility", 1)

	timer.Simple(60, function() 
		curplayer:RemoveBoost("chew", "perception")
		curplayer:RemoveBoost("chew", "agility")
	end)


end)
ITEM.weight = 0.1


ITEM:DecideFunction()
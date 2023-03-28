ITEM.name = "Ice Cold Sunset Sarsaparilla" 
ITEM.model = "models/fnv/clutter/junk/ssbottle01.mdl"
ITEM.thirst = 35
ITEM.description = "A bottle of Sunset Sarsaparilla, chilled to perfection."
ITEM.longdesc = "A bottle of the famed root beer, chilled in a fridge or ice box - a luxury few have. The result is incredibly satisfying - best savor it while you can."
ITEM.quantity = 2
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)


	local rollforcaps = math.random(0, 100)

	if (rollforcaps >= 95) then
		item.player:GetCharacter():GetInventory():Add("bluestarcap", 1)
		item.player:NewVegasNotify("You find a Blue Star Bottlecap!", "messageSurprise", 8)
	else
		item.player:GetCharacter():GiveMoney(1)
		item.player:NewVegasNotify("You add the bottle cap to your stash.", "messageNeutral", 8)
	end 


end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
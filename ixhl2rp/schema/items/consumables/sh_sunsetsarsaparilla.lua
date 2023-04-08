ITEM.name = "Sunset Sarsaparilla" 
ITEM.model = "models/fnv/clutter/junk/ssbottle01.mdl"
ITEM.thirst = 25
ITEM.description = "A bottle of Sunset Sarsaparilla."
ITEM.longdesc = "A warm, sealed bottle of Sunset Sarsaparilla, a root beer that was the West Coast's preferred sodapop. Quite refreshing. Roughly one in every twenty bottles is said to have an unusual blue star on the inside of the cap."
ITEM.quantity = 1
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.cookable = false
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
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

	item.player:GetCharacter():GetInventory():Add("emptybottle", 1)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
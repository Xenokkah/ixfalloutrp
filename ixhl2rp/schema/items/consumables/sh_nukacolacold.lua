ITEM.name = "Ice Cold Nuka Cola"
ITEM.model = "models/fnv/clutter/junk/sodabottleclosed01.mdl"
ITEM.thirst = 30
ITEM.description = "A bottle of Nuka Cola, chilled to perfection."
ITEM.longdesc = "Regular Nuka is fine, but only those priviledged enough to have a working fridge or ice-box can taste the stuff frozen to the point the glass becomes frosted- it's the nectar of gods and so very refreshing. Best drink this or place it in another cold place lest it warm up again."
ITEM.quantity = 1
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(10)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:GetCharacter():GiveMoney(1)
	item.player:NewVegasNotify("You add the bottle cap to your stash.", "messageNeutral", 8)
	item.player:GetCharacter():GetInventory():Add("emptybottle", 1)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
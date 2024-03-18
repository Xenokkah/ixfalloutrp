ITEM.name = "Boiled Water"
ITEM.model = "models/mosi/fallout4/props/drink/dirtywater.mdl"
ITEM.thirst = 15
ITEM.description = "A carton of boiled water."
ITEM.longdesc = "A carton of irradiated water that has been boiled over a fire before being served, reducing harmful contaminants in it, while not being 100% safe."
ITEM.quantity = 1
ITEM.price = 5
ITEM.width = 1
ITEM.height = 2
ITEM.sound = "fosounds/fix/npc_humandrinking_soda_01.mp3"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:addRadiation(5)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
	item.player:GetCharacter():GetInventory():Add("emptybottle", 1)
end)
ITEM.weight = 0.1


ITEM:DecideFunction()
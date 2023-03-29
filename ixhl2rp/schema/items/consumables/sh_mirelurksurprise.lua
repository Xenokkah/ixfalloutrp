ITEM.name = "Mirelurk Surprise"
ITEM.model = "models/mosi/fnv/props/food/mirelurkspecial.mdl"
ITEM.hunger = 25
ITEM.thirst = 15
ITEM.description = "A prepared meal of Mirelurk."
ITEM.longdesc = "A soup made from Mirelurk. It turns out the surprise is the giant claw in the middle."
ITEM.quantity = 2
ITEM.price = 5
ITEM.width = 2
ITEM.height = 1
ITEM.sound = "npc/barnacle/barnacle_crunch2.wav"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a bite of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
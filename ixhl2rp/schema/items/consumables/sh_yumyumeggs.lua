ITEM.name = "YumYum Deviled Eggs"
ITEM.model = "models/fnv/clutter/junk/yumyumdeviledeggs.mdl"
ITEM.hunger = 10
ITEM.description = "A box of preserved, deviled eggs."
ITEM.longdesc = "Pre-war food is often seen lowly due to the poor taste and radiation, so god knows why people eat powdered eggs that've been sitting in a cardboard box for centuries."
ITEM.quantity = 1
ITEM.price = 20
ITEM.width = 1
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
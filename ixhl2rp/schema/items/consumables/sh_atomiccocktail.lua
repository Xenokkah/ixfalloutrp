ITEM.name = "Atomic Cocktail"
ITEM.model = "models/fnv/clutter/junk/nvatomiccocktail.mdl"
ITEM.thirst = 25
ITEM.description = "A mixed drink served in a rocket-shaped bottle."
ITEM.longdesc = "The Atomic Cocktail is a mix of chems, soda, and alcohol for a very unique experience. Your better judgement says mixing those things is a very bad idea, but your primitive lizard brain loves the fun bottle shape."
ITEM.quantity = 3
ITEM.price = 5
ITEM.width = 1
ITEM.height = 3
ITEM.sound = "npc/barnacle/barnacle_gulp2.wav"
ITEM.flag = "5"
ITEM:Hook("use", function(item)
	item.player:EmitSound(item.sound or "items/battery_pickup.wav")
	ix.chat.Send(item.player, "iteminternal", "takes a swig of their "..item.name..".", false)
end)
ITEM.weight = 0.1
ITEM.heal = 3
ITEM.healot = 2
ITEM:DecideFunction()
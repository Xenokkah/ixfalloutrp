ITEM.name = "Basic Box of Scraps"
ITEM.description= "A box of common scrap components."
ITEM.longdesc = "An unsorted box of scrap bits - generally base components found commonly or household items."
ITEM.model = "models/mosi/fallout4/props/junk/modbox.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 25
ITEM.category = "Kits"
ITEM.itemsForcedDrop = {}
ITEM.items[1] = {
	dropAmount = 3, --How many times it will roll for drop
	dropRareChance = 30, --chances for the rarer drops
	dropVeryRareChance = 20,
	itemsCommon = {
		{"wood"},
		{"steel"},
		{"cloth"},
		{"emptybottle"},
		{"abraxo"},
		{"dishrag"},
	},
	itemsRare = {
		{"nails"}, 
		{"ducttape"}, 
		{"soap"}, 
	},
	itemsVeryRare = {
		{"globe"}, 
		{"plastic"}, 
		{"clipboard"}, 
		{"blastradius"}, 
		{"alarmclock"}, 
	}
}








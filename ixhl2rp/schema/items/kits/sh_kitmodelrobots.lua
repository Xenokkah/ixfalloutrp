ITEM.name = "Robot Blind Box Model Kit"
ITEM.description= "A cardboard box containing one robot model toy to assemble."
ITEM.longdesc = "A 'blind box' model kit, featuring one of many plastic and aluminum mini-models of your favorite robots, or more rarely, one of three 'combo-bot' models! Collect all eight!"
ITEM.model = "models/mosi/fallout4/props/junk/toymodelkit.mdl"
ITEM.width = 2
ITEM.height = 1
ITEM.price = 25
ITEM.category = "Kits"
ITEM.itemsForcedDrop = {}
ITEM.items[1] = {
	dropAmount = 1, --How many times it will roll for drop
	dropRareChance = 25, --chances for the rarer drops
	dropVeryRareChance = 15,
	itemsCommon = {
		{"toyeyebot"},
		{"toymisterhandy"},
		{"toyprotectron"},
	},
	itemsRare = {
		{"toygutsy"}, 
		{"toysentrybot"}, 
	},
	itemsVeryRare = {
		{"toymisterprotectron"}, 
		{"toyprotectronsentry"}, 
		{"toysentryhandy"}, 
	}
}







--[[ Example format
ITEM.items[1] = {
	dropAmount = 5, --How many times it will roll for drop
	dropRareChance = 40, --chances for the rarer drops
	dropVeryRareChance = 20,
	itemsCommon = {
		{"9x18"},
		{"9x19"},
		{"12gauge"},
	},
	itemsRare = {
		{"57x28"},
		{"380acp"},
		{"762x25"},
	},
	itemsVeryRare = {
		{"22lr"},
		{"mp5", {["durability"] = 30}}, --Data can also be passed
		{"45acp"},
	},
}
]]--


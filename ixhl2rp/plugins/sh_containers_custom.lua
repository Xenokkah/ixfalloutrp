--[[
	ix.container.Register(model, {
		name = "Crate",
		description = "A simple wooden create.",
		width = 4,
		height = 4,
		locksound = "",
		opensound = ""
	})
]]--

PLUGIN.name = "Custom Containers Test"
PLUGIN.author = "Bath"
PLUGIN.description = "At."

ix.container.Register("models/props_junk/wood_crate001a.mdl", {
	name = "Crate",
	description = "A simple wooden crate.",
	width = 4,
	height = 4,
})

ix.container.Register("models/props_c17/lockers001a.mdl", {
	name = "Locker",
	description = "A white locker.",
	width = 3,
	height = 5,
})

ix.container.Register("models/props_wasteland/controlroom_storagecloset001a.mdl", {
	name = "Metal Cabinet",
	description = "A green metal cabinet.",
	width = 8,
	height = 10,
})

ix.container.Register("models/props_wasteland/controlroom_storagecloset001b.mdl", {
	name = "Metal Cabinet",
	description = "A green metal cabinet.",
	width = 8,
	height = 10,
})

ix.container.Register("models/props_wasteland/controlroom_filecabinet001a.mdl", {
	name = "File Cabinet",
	description = "A metal filing cabinet.",
	width = 5,
	height = 3
})

ix.container.Register("models/props_wasteland/controlroom_filecabinet002a.mdl", {
	name = "File Cabinet",
	description = "A metal filing cabinet.",
	width = 3,
	height = 6,
})

ix.container.Register("models/props_lab/filecabinet02.mdl", {
	name = "File Cabinet",
	description = "A metal filing cabinet.",
	width = 5,
	height = 3
})

ix.container.Register("models/props_c17/furniturefridge001a.mdl", {
	name = "Refrigerator",
	description = "A metal box for keeping food in.",
	width = 6,
	height = 8,
})

ix.container.Register("models/props_wasteland/kitchen_fridge001a.mdl", {
	name = "Large Refrigerator",
	description = "A large metal box for storing even more food in.",
	width = 6,
	height = 8,
})

ix.container.Register("models/props_junk/trashbin01a.mdl", {
	name = "Trash Bin",
	description = "What do you expect to find in here?",
	width =4,
	height =6,
})

ix.container.Register("models/props_junk/trashdumpster01a.mdl", {
	name = "Dumpster",
	description = "A dumpster meant to stow away trash. It emanates an unpleasant smell.",
	width = 14,
	height = 10
})

ix.container.Register("models/items/ammocrate_smg1.mdl", {
	name = "Ammo Crate",
	description = "A heavy crate that stores ammo.",
	width = 10,
	height = 6,
	OnOpen = function(entity, activator)
		local closeSeq = entity:LookupSequence("Close")
		entity:ResetSequence(closeSeq)

		timer.Simple(2, function()
			if (entity and IsValid(entity)) then
				local openSeq = entity:LookupSequence("Open")
				entity:ResetSequence(openSeq)
			end
		end)
	end
})

ix.container.Register("models/props_forest/footlocker01_closed.mdl", {
	name = "Footlocker",
	description = "A small chest to store belongings in.",
	width = 5,
	height = 3
})

ix.container.Register("models/Items/item_item_crate.mdl", {
	name = "Item Crate",
	description = "A crate to store some belongings in.",
	width = 5,
	height = 3
})

ix.container.Register("models/maxib123/dufflebag.mdl", {
	name = "Duffel Bag",
	description = "A green duffel bag.",
	width = 3,
	height = 3
})

ix.container.Register("models/maxib123/dufflebag.mdl", {
	name = "Duffel Bag",
	description = "A green duffel bag.",
	width = 4,
	height = 2
})

ix.container.Register("models/maxib123/floorsafe.mdl", {
	name = "Safe",
	description = "A solid metal safe with a numeric keypad.",
	width = 3,
	height = 3
})

ix.container.Register("models/maxib123/suitcase.mdl", {
	name = "Suitcase",
	description = "A leather-covered traveling case.",
	width = 3,
	height = 3
})

ix.container.Register("models/maxib123/trunk.mdl", {
	name = "Trunk",
	description = "A hefty looking metal trunk with lots of room for goodies.",
	width = 5,
	height = 5
})

ix.container.Register("models/maxib123/metalstoragecontainer.mdl", {
	name = "Metal Box",
	description = "A simple metal box.",
	width = 3,
	height = 3
})

ix.container.Register("models/maxib123/medkit.mdl", {
	name = "First Aid Kit",
	description = "A hard case for holding medical supply.",
	width = 2,
	height = 2,
})

ix.container.Register("models/vex/seventysix/vending/nukacolamachine.mdl", {
    name = "Busted Nuka Cola Machine",
    description = "An Out-Of-Order Nuka Cola Machine.",
    width = 6,
    height = 6,
})

ix.container.Register("models/models/fallout4/steamer_trunk.mdl", {
    name = "Decayed Trunk",
    description = "An old trunk with rusted clips.",
    width = 5,
    height = 5,
})

ix.container.Register("models/models/fallout4/safe_standing.mdl", {
    name = "Heavy Metal Safe",
    description = "A reinforced safe with a complicated lock.",
    width = 4,
    height = 4,
})

ix.container.Register("models/mosi/fallout4/ammo/5mm.mdl", {
    name = "Ammunition Can",
    description = "A metallic container fit for safely storing munitions.",
    width = 3,
    height = 3,
})

ix.container.Register("models/props_fallout/cabinet01.mdl", {
    name = "Clothing Wardrobe",
    description = "An old, wooden wardrobe.",
    width = 4,
    height = 6,
})

ix.container.Register("models/props_fallout/trunk01.mdl", {
    name = "Lockbox",
    description = "A small, metallic lockbox",
    width = 4,
    height = 3,
})

ix.container.Register("models/fallout3/clutter/toolbox.mdl", {
    name = "Toolbox",
    description = "A small, metallic toolbox",
    width = 3,
    height = 3,
})
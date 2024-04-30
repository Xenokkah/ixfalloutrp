
local PLUGIN = PLUGIN

PLUGIN.spawner = PLUGIN.spawner or {}
PLUGIN.items = PLUGIN.items or {}
PLUGIN.items.junk = PLUGIN.items.junk or {}
PLUGIN.items.handloading = PLUGIN.items.handloading or {}
PLUGIN.items.food = PLUGIN.items.food or {}
PLUGIN.spawner.positions = PLUGIN.spawner.positions or {}

PLUGIN.items.junk.common = {
	"cloth",
	"wood",
	"leather",
	"glass",
	"kitscrapboxbasic",
	"emptybottle",
	"ducttape",
	"dishrag",
	"soap",
	"rustedcannister",
	"prewarmoney",
	"coffeecup",
	"blastradius",
	"homemadebattery",
	"leadcan",
	"globe",
	"buttercuptoy",
	"wonderglue",
	"tincan",
	"alarmclock",
	"bowlingball",
	"babyrattle",
	"5lbweight",
	"10lbweight",
	"abraxo",
	"bowl",
	"bowlingball",
	"camera",
	"baseball",
	"clipboard",
	"jangles",
	"nails",
	"kitmodelrobots",
	"rustedcannister",
	"medicalsaw",
	"teddybear",
	"fuse",
	"antifreeze",
	"blowtorch",
	"babybottle",
	"ashtray",
	"ovenmitt",
	"turpentine",
	"fertilizerbag"
}

PLUGIN.items.junk.rare = {
	"gold",
	"silver",
	"drainedecp",
	"drainedmfc",
	"biometricscanner",
	"distresspulser",
	"kitmodelrobots",
	"microscope",
	"fusioncore",

}

PLUGIN.items.handloading.common = {
	"casingsmallpistol",
	"casingshotgun",
	"casinglargepistol",
	"powderpistol",
	"primershotshell",
	"primersmallpistol",
	"primerlargepistol",
	"leadcan",
}

PLUGIN.items.handloading.rare = {
	"casinglargerifle",
	"powderrifle",
	"primersmallrifle",
	"primerlargerifle",
}

PLUGIN.items.food.common = {
	"instamash",
	"dandyboyapples",
	"cram",
	"sugarbombs",
	"fancyladssnackcakes",
	"beer",
	"nukacola",
	"sunsetsarsaparilla",
	"potatochips",
	"waterdirty",
	"porknbeans",
	"salisburysteak",
	"yumyumeggs",
	"bubblegum"
}

PLUGIN.items.food.rare = {
	"vodka",
	"wine",
	"atomiccocktail",
	"apple",
	"maize",
	"pintobeans",
}


util.AddNetworkString("ixItemSpawnerManager")
util.AddNetworkString("ixItemSpawnerDelete")
util.AddNetworkString("ixItemSpawnerEdit")
util.AddNetworkString("ixItemSpawnerGoto")
util.AddNetworkString("ixItemSpawnerSpawn")
util.AddNetworkString("ixItemSpawnerChanges")

function PLUGIN:LoadData()
	PLUGIN.spawner.positions = self:GetData() or {}
end

function PLUGIN:SaveData()
	self:SetData(PLUGIN.spawner.positions)
end

function PLUGIN:AddSpawner(client, position, title, type)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local respawnTime = ix.config.Get("spawnerRespawnTime", 600)
	local offsetTime  = ix.config.Get("spawnerOffsetTime", 100)
	if (respawnTime < offsetTime) then
		offsetTime = respawnTime - 60
	end

	table.insert(PLUGIN.spawner.positions, {
		["ID"] = os.time(),
		["title"] = title,
		["delay"] = math.random(respawnTime - offsetTime, respawnTime + offsetTime),
		["lastSpawned"] = os.time(),
		["author"] = client:SteamID64(),
		["position"] = position,
		["type"] = type,
		["rarity"] = ix.config.Get("spawnerRareItemChance", 0)
	})

end

function PLUGIN:RemoveSpawner(client, title)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	for k, v in ipairs(PLUGIN.spawner.positions) do
		if (v.title:lower() == title:lower()) then
			table.remove(PLUGIN.spawner.positions, k)
			return true
		end
	end
	return false
end

function PLUGIN:ForceSpawn(client, spawner)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end
	if !(ix.config.Get("spawnerActive")) then return end

	spawner.lastSpawned = os.time()
	local rareChance = math.random(100)
	if spawner.type == "junk" then
		if (rareChance <= ix.config.Get("spawnerRareItemChance", 0)) then
			ix.item.Spawn(table.Random(PLUGIN.items.junk.rare), spawner.position)
		else
			ix.item.Spawn(table.Random(PLUGIN.items.junk.common), spawner.position)
		end

	elseif spawner.type == "handloading" then
		if (rareChance <= ix.config.Get("spawnerRareItemChance", 0)) then
			ix.item.Spawn(table.Random(PLUGIN.items.handloading.rare), spawner.position)
		else
			ix.item.Spawn(table.Random(PLUGIN.items.handloading.common), spawner.position)
		end

	elseif spawner.type == "food" then
		if (rareChance <= ix.config.Get("spawnerRareItemChance", 0)) then
			ix.item.Spawn(table.Random(PLUGIN.items.food.rare), spawner.position)
		else
			ix.item.Spawn(table.Random(PLUGIN.items.food.common), spawner.position)
		end
	end 
end

function PLUGIN:Think()
	if (table.IsEmpty(PLUGIN.spawner.positions) or !(ix.config.Get("spawnerActive", false))) then return end

	for k, v in pairs(PLUGIN.spawner.positions) do
		if (v.lastSpawned + (v.delay * 60) < os.time()) then
			v.lastSpawned = os.time()
			local rareChance = math.random(100)

			if v.type == "junk" then
				if (rareChance <= ix.config.Get("spawnerRareItemChance", 0)) then
					ix.item.Spawn(table.Random(PLUGIN.items.junk.rare), v.position)
				else
					ix.item.Spawn(table.Random(PLUGIN.items.junk.common), v.position)
				end
		
			elseif v.type == "handloading" then
				if (rareChance <= ix.config.Get("spawnerRareItemChance", 0)) then
					ix.item.Spawn(table.Random(PLUGIN.items.handloading.rare), v.position)
				else
					ix.item.Spawn(table.Random(PLUGIN.items.handloading.common), v.position)
				end

			elseif v.type == "food" then
				if (rareChance <= ix.config.Get("spawnerRareItemChance", 0)) then
					ix.item.Spawn(table.Random(PLUGIN.items.food.rare), v.position)
				else
					ix.item.Spawn(table.Random(PLUGIN.items.food.common), v.position)
				end
			end 


		end
	end
end

net.Receive("ixItemSpawnerDelete", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local item = net.ReadString()
	PLUGIN:RemoveSpawner(client, item)
end)

net.Receive("ixItemSpawnerGoto", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local position = net.ReadVector()
	client:SetPos(position)
end)

net.Receive("ixItemSpawnerSpawn", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local item = net.ReadTable()
	PLUGIN:ForceSpawn(client, item)
end)

net.Receive("ixItemSpawnerChanges", function(length, client)
	if !(CAMI.PlayerHasAccess(client, "Helix - Item Spawner", nil)) then return end

	local changes = net.ReadTable()

	for k, v in ipairs(PLUGIN.spawner.positions) do
		if (v.ID == changes[1]) then
			v.title = changes[2]
			v.delay = math.Clamp(changes[3], 1, 10000)
			v.rarity  = math.Clamp(changes[4], 0, 100)
			v.type = changes[5]
			if v.type ~= "food" and type ~= "handloading" and type ~= "junk" then v.type = "junk" end
		end
	end
end)

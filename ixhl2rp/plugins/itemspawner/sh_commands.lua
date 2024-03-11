
local PLUGIN = PLUGIN

ix.command.Add("ItemSpawnerAdd", {
	description = "@cmdItemSpawnerAdd",
	privilege = "Item Spawner",
	superAdminOnly = true,
	arguments = {
		ix.type.string, ix.type.string
	},
	OnRun = function(self, client, title, type)
		local location = client:GetEyeTrace().HitPos
		location.z = location.z + 10

		type = string.lower(type)
		-- could create an array and iterate through it to check if type is one of them, but i'm not gonna
		if type ~= "food"  and type ~= "handloading" and type ~= "junk" then return "Must be one of type: Food, Handloading, Junk" end

		PLUGIN:AddSpawner(client, location, title, type)
	end
})

ix.command.Add("ItemSpawnerRemove", {
	description = "@cmdItemSpawnerRemove",
	privilege = "Item Spawner",
	superAdminOnly = true,
	arguments = {
		ix.type.string
	},
	OnRun = function(self, client, title)
		return PLUGIN:RemoveSpawner(client, title) and "@cmdRemoved" or "@cmdNoRemoved"
	end
})

ix.command.Add("ItemSpawnerList", {
	description = "@cmdItemSpawnerList",
	privilege = "Item Spawner",
	superAdminOnly = true,
	OnRun = function(self, client)
		if (#PLUGIN.spawner.positions == 0) then
			return "@cmdNoSpawnPoints"
		end
		net.Start("ixItemSpawnerManager")
			net.WriteTable(PLUGIN.spawner.positions)
		net.Send(client)
	end
})

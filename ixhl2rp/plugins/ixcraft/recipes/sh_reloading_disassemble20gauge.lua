RECIPE.name = "10 Gauge Buckshot Breakdown"
RECIPE.description = "Disassemble a full box of 20 gauge buckshot shells for their components."
RECIPE.model = "models/mosi/fallout4/ammo/shotgunshells.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_20gaugeammo"] = 1
}

RECIPE.results = {
	["leadcan"] = 1,
	["casingshotgun"] = 1,
	["powderpistol"] = 1,
	["primersmallpistol"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	return false
end)



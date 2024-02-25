RECIPE.name = "20 Gauge Buckshot"
RECIPE.description = "Hand-load some buckshot shells."
RECIPE.model = "models/mosi/fallout4/ammo/shotgunshells.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["leadcan"] = 1,
	["casingshotgun"] = 1,
	["powderpistol"] = 1,
	["primersmallpistol"] = 1,
}

RECIPE.results = {
	["ammo_20gaugeammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end
	return false
end)



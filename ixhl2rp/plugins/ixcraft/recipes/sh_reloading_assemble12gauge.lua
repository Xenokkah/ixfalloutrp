RECIPE.name = "12 Gauge Buckshot"
RECIPE.description = "Hand-load some buckshot shells."
RECIPE.model = "models/mosi/fallout4/ammo/shotgunshells.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["leadcan"] = 2,
	["casingshotgun"] = 1,
	["powderpistol"] = 2,
	["primersmallpistol"] = 1,
}

RECIPE.results = {
	["ammo_12gaugeammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	return false
end)



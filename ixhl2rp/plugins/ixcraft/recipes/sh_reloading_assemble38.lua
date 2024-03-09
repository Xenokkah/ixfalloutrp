RECIPE.name = ".38 Special"
RECIPE.description = "Hand-load some .38 Special."
RECIPE.model = "models/mosi/fallout4/ammo/38.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["leadcan"] = 1,
	["casingsmallpistol"] = 1,
	["powderpistol"] = 1,
	["primersmallpistol"] = 1,
}

RECIPE.results = {
	["ammo_38specialammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	return false
end)



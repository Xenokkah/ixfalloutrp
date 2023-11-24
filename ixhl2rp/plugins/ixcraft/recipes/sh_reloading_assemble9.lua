RECIPE.name = "9mm"
RECIPE.description = "Hand-load some 9mm."
RECIPE.model = "models/visualitygaming/fallout/ammo/9mm.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["leadcan"] = 1,
	["casingsmallpistol"] = 1,
	["powderpistol"] = 2,
	["primersmallpistol"] = 1,
}

RECIPE.results = {
	["ammo_9mmammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end
	return false
end)



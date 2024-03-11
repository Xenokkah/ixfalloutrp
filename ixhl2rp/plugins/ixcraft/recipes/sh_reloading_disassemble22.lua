RECIPE.name = ".22lr Breakdown"
RECIPE.description = "Disassemble some .22lr."
RECIPE.model = "models/fallout new vegas/22_ammo.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_22lrammo"] = 1
}

RECIPE.results = {
	["leadcan"] = 1,
	["casingsmallpistol"] = 1,
	["powderpistol"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	return false
end)



RECIPE.name = "9mm Breakdown"
RECIPE.description = "Disassemble a full box of 9mm rounds for their components."
RECIPE.model = "models/visualitygaming/fallout/ammo/9mm.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_9mmammo"] = 1
}

RECIPE.results = {
	["leadcan"] = 1,
	["casingsmallpistol"] = 1,
	["powderpistol"] = 2,
	["primersmallpistol"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	return false
end)



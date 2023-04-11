RECIPE.name = ".38 Special Breakdown"
RECIPE.description = "Disassemble a full box of .38 Special rounds for their components."
RECIPE.model = "models/mosi/fallout4/ammo/38.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_38specialammo"] = 1
}

RECIPE.results = {
	["leadcan"] = 1,
	["casingsmallpistol"] = 1,
	["powderpistol"] = 1,
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



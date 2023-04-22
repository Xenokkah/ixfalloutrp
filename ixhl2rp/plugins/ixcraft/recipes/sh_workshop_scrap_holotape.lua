RECIPE.name = "Holotape"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/holotape.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["holotape"] = 1,
}

RECIPE.results = {
	["plastic"] = 1,
	["circuitry"] = 1,
	["copper"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
	
end)



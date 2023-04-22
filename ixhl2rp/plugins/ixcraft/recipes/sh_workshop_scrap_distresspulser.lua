RECIPE.name = "Broken Distress Beacon"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/distresspulser.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["distresspulser"] = 1,
}

RECIPE.results = {
	["circuitry"] = 2,
	["plastic"] = 1,
	["screws"] = 1,
	["gears"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
	
end)



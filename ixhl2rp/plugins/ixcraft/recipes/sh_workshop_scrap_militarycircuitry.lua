RECIPE.name = "Military Circuitry"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/circuitboard.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["militarycircuitry"] = 1,
}

RECIPE.results = {
	["glass"] = 1,
	["gold"] = 1,
	["copper"] = 1,
	["circuitry"] = 2,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
	
end)



RECIPE.name = "Microscope"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/microscope.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["microscope"] = 1,
}

RECIPE.results = {
	["crystal"] = 2,
	["gears"] = 2,
	["screws"] = 2,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



RECIPE.name = "Blowtorch"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/blowtorch.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["blowtorch"] = 1,
}

RECIPE.results = {
	["springs"] = 1,
	["screws"] = 1,
	["aluminum"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



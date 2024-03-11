RECIPE.name = "Baby Bottle"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/babybottle02.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["babybottle"] = 1,
}

RECIPE.results = {
	["plastic"] = 1,
        ["rubber"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



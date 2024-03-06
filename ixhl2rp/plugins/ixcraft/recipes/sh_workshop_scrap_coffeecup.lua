RECIPE.name = "Coffee Cup"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fnv/props/junk/coffeemug.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["coffeecup"] = 1,
}

RECIPE.results = {
	["ceramic"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



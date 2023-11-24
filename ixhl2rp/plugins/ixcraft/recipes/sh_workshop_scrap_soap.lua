RECIPE.name = "Soap"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/soap.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["soap"] = 1,
}

RECIPE.results = {
	["antiseptic"] = 2,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



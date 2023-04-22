RECIPE.name = "Large Wonderglue"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/wonderglue_large.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["wonderglue"] = 1,
}

RECIPE.results = {
	["adhesive"] = 4,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
	
end)



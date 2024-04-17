RECIPE.name = "Fusion Core"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/models/fallout4/fusion_core.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["fusioncore"] = 1,
}

RECIPE.results = {
	["nuclearmaterial"] = 2,
    ["lead"] = 1,
    ["plastic"] = 2,
    ["steel"] = 2,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



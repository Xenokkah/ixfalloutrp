RECIPE.name = "Duct Tape Three Pack"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/ducttape3pack.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["ducttapethreepack"] = 1,
}

RECIPE.results = {
	["adhesive"] = 3,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



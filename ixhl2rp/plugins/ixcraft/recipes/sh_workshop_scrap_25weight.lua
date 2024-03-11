RECIPE.name = "25lb Weight"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/25lb.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["25lbweight"] = 1,
}

RECIPE.results = {
	["lead"] =12,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



RECIPE.name = "Blast Radius"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/boardgame.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["blastradius"] = 1,
}

RECIPE.results = {
	["wood"] = 2,
	["plastic"] = 1,
	["nuclearmaterial"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



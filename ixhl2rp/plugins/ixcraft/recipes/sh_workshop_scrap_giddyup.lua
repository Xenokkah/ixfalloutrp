RECIPE.name = "Giddyup Buttercup"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/ovenmitt.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["buttercuptoy"] = 1,
}

RECIPE.results = {
	["steel"] = 3,
	["gears"] = 3,
	["screws"] = 3,
	["circuitry"] = 2,
}



RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



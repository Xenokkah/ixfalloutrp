RECIPE.name = "Homemade Battery"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/makeshiftbattery.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["homemadebattery"] = 1,
}

RECIPE.results = {
	["lead"] = 1,
	["acid"] = 1,
	["steel"] = 1,
	["wood"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



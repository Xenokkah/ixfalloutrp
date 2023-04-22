RECIPE.name = "Alarm Clock"
RECIPE.description = "Break some wasteland junk down into components."
RECIPE.model = "models/mosi/fallout4/props/junk/alarmclock.mdl"
RECIPE.category = "Scrap Junk"
RECIPE.requirements = {
	["alarmclock"] = 1,
}

RECIPE.results = {
	["gears"] = 1,
	["springs"] = 1,
	["glass"] = 1,
	["steel"] = 1,
	["nuclearmaterial"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
	
end)



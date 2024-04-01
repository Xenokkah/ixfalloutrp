RECIPE.name = "Gun Oil"
RECIPE.description = "Mix some oil together in an empty bottle for use in basic cleaning of used firearms."
RECIPE.model = "models/mosi/fallout4/props/junk/cookingoil.mdl"
RECIPE.category = "Weapon Repair"
RECIPE.requirements = {
	["emptybottle"] = 1,
	["acid"] = 1,
	["plastic"] = 1,
	["adhesive"] = 1,
}

RECIPE.results = {
	["gunoil"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



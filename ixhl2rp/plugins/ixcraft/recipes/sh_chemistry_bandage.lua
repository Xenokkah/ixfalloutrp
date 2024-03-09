RECIPE.name = "Bandage"
RECIPE.description = "Disinfect some cloth for use as a bandage."
RECIPE.model = "models/warz/items/bandage.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["cloth"] = 2,
	["antiseptic"] = 1,
}

RECIPE.results = {
	["bandage"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



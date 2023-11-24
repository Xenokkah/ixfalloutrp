RECIPE.name = "Ant Steak"
RECIPE.description = "Fry up some ant meat to make some steak."
RECIPE.model = "models/fnv/clutter/food/fireantmeat.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["antmeatraw"] = 1,
}

RECIPE.results = {
	["antmeatcooked"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end
	
	return false
end)



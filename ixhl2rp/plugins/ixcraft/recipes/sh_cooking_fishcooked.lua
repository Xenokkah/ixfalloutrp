RECIPE.name = "Fish Filet"
RECIPE.description = "De-bone and grill a fish filet."
RECIPE.model = "models/mosi/fnv/props/food/geckosteak.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["fishraw"] = 1,
}

RECIPE.results = {
	["fishcooked"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	
	return false
end)



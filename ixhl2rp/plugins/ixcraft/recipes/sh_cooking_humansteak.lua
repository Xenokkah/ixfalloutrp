RECIPE.name = "'Long Pork'"
RECIPE.description = "Fry up 'long pork', making for a 'very delicious' and filling 'meal'."
RECIPE.model = "models/mosi/fnv/props/food/humanflesh.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["humanfleshraw"] = 1,
}

RECIPE.results = {
	["humanfleshcooked"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
end)



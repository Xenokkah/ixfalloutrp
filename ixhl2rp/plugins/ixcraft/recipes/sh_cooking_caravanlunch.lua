RECIPE.name = "Assemble Caravan Lunch"
RECIPE.description = "Fill up a lunchbox with some pre-wear food for a meal on the go."
RECIPE.model = "models/mosi/fnv/props/food/lunchbox_meal.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["lunchbox"] = 1,
	["instamash"] = 1,
	["porknbeans"] = 1,
	["cram"] = 1,
}

RECIPE.results = {
	["caravanlunch"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
end)



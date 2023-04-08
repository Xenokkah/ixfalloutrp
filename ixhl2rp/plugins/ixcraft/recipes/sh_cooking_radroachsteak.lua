RECIPE.name = "Radroach Steak"
RECIPE.description = "Fry up some Radroach to make it marginally less awful."
RECIPE.model = "models/fnv/clutter/food/roachmeat.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["radroachmeatraw"] = 1,
}

RECIPE.results = {
	["radroachmeatcooked"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
		return false
	end
end)



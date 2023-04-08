RECIPE.name = "Dog Steak"
RECIPE.description = "Fry up some dog steak, which probably makes you some kind of monster, for a decent meal."
RECIPE.model = "models/mosi/fnv/props/food/dogmeat.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["dogmeatraw"] = 1,
}

RECIPE.results = {
	["dogmeatcooked"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
		return false
	end

	
end)



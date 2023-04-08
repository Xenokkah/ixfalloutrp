RECIPE.name = "Mole Rat Steak"
RECIPE.description = "Fry up some mole rat meat for a chewy, but relatively satisfying meal."
RECIPE.model = "models/mosi/fnv/props/food/moleratsteak.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["moleratmeatraw"] = 1,
}

RECIPE.results = {
	["moleratmeatcooked"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
		return false
	end
end)



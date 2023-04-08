RECIPE.name = "Brahmin Steak"
RECIPE.description = "Fry up some Brahmin for a delicious meal. While those who know their meat can produce wonders, most people will just settle for a medium rare, juicy Brahmin steak, no fancy spices or rubs needed."
RECIPE.model = "models/mosi/fnv/props/food/steak.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["brahminmeatraw"] = 1,
}

RECIPE.results = {
	["brahminmeatcooked"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
		return false
	end
end)



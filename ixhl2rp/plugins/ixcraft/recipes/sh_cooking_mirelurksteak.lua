RECIPE.name = "Steamed Mirelurk"
RECIPE.description = "Steam some Mirelurk in clean water."
RECIPE.model = "models/mosi/fnv/props/food/steamedmirelurk.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["mirelurkmeatraw"] = 1,
	["waterclean"] = 1,
}

RECIPE.results = {
	["mirelurkmeatcooked"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
		return false
	end
end)



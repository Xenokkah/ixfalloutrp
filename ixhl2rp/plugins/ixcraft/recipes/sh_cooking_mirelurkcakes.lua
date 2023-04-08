RECIPE.name = "Mirelurk Cakes"
RECIPE.description = "Bake some delightful seafood puff pastry."
RECIPE.model = "models/mosi/fnv/props/food/mirelurkcake.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["brahminmilk"] = 1,
	["flour"] = 1,
	["mirelurkmeatraw"] = 1,
	["yumyumeggs"] = 1,
}

RECIPE.results = {
	["mirelurkcake"] = 4
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSurvival() < 40) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
		return false
	end
end)



RECIPE.name = "'Long Pork' Pie"
RECIPE.description = "Create a 'delicious' and 'crumbly' dish from some 'long pork'."
RECIPE.model = "models/mosi/fnv/props/food/strangemeatpie.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["humanfleshraw"] = 1,
	["yumyumeggs"] = 1,
	["waterclean"] = 1,
	["flour"] = 1
}

RECIPE.results = {
	["strangemeatpie"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSurvival() < 25) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
		return false
	end
end)



RECIPE.name = "Mirelurk Surprise"
RECIPE.description = "Prepare an appetizing and visually intriguing seafood dish."
RECIPE.model = "models/mosi/fnv/props/food/mirelurkspecial.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["beer"] = 1,
	["mirelurkmeatraw"] = 1,
	["pricklypear"] = 1,
	["pinyonnuts"] = 1,
}

RECIPE.results = {
	["mirelurksurprise"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSurvival() < 25) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
end)



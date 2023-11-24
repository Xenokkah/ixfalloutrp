RECIPE.name = "Cactus Water"
RECIPE.description = "Extract clean water from Prickly Pear Fruit."
RECIPE.model = "models/mosi/fnv/props/drink/water_clean.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["emptybottle"] = 1,
	["pricklypear"] = 2,
}

RECIPE.results = {
	["waterclean"] = 1

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSurvival() < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false

end)


RECIPE.name = "Gecko Kebab"
RECIPE.description = "Skewer some gecko meat, peppers, and fruit to make a delicious creation."
RECIPE.model = "models/fnv/clutter/food/iguanabits.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["geckomeatcooked"] = 1,
	["jalapenopepper"] = 1,
	["yucca"] = 1,
}

RECIPE.results = {
	["geckokebab"] = 2
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetSkill("survival", 0) < 10) then 
		return false
	end 


	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	
	return false
end)



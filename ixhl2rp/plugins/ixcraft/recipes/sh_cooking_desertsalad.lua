RECIPE.name = "Desert Salad"
RECIPE.description = "Prepare a delicious salad."
RECIPE.model = "models/fnv/clutter/food/desertsalad.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["brahminmeatcooked"] = 1,
	["barrelcactus"] = 1,
	["pinyonnuts"] = 1,
}

RECIPE.results = {
	["desertsalad"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
end)



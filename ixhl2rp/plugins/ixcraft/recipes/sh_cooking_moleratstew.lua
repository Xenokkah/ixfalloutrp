RECIPE.name = "Mole Rat Stew"
RECIPE.description = "Create a tasty stew from common ingredients."
RECIPE.model = "models/mosi/fnv/props/food/ratstew.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["beer"] = 1,
	["moleratmeatraw"] = 1,
	["maize"] = 1,
	["pintobeans"] = 1,
}

RECIPE.results = {
	["moleratstew"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
end)



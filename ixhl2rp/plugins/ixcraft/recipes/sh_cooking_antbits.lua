RECIPE.name = "Ant Bits"
RECIPE.description = "Apply your culinary knowledge to make an unappetizing dish surprisingly pleasant."
RECIPE.model = "models/mosi/fnv/props/food/antbits.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["antmeatraw"] = 1,
	["waterclean"] = 1,
}

RECIPE.results = {
	["antbits"] = 1
	

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



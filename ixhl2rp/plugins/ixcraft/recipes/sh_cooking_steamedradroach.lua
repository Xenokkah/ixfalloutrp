RECIPE.name = "Steamed Radroach"
RECIPE.description = "With a few more ingredients, ordinary radroach meat can be made into something more appealing."
RECIPE.model = "models/mosi/fnv/props/food/steamedradroach.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["beer"] = 1,
	["radroachmeatraw"] = 1,
	["waterclean"] = 1,
	["pintobeans"] = 1,
}

RECIPE.results = {
	["radroachsteamed"] = 1
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



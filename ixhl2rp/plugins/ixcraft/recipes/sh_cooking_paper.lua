RECIPE.name = "Paper"
RECIPE.description = "Press some wood pulp into some decent paper with an acid wash."
RECIPE.model = "models/props_c17/paper01.mdl"
RECIPE.category = "Misc"
RECIPE.requirements = {
	["wood"] = 1,
	["acid"] = 1,
}

RECIPE.results = {
	["paper"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	
	return false
end)



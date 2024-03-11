RECIPE.name = "Rubber Inlay"
RECIPE.description = "Create a rubber inlay for armor suits, which grants a significant protection boost against energy and heat sources."
RECIPE.model = "models/weapons/w_suitcase_passenger.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["cloth"] = 2,
	["rubber"] = 3,
	["adhesive"] = 3,
}

RECIPE.results = {
	["leatherupgrade3"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetSkill("repair", 0) < 35) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



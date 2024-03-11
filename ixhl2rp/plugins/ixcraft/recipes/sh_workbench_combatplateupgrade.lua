RECIPE.name = "Combat Plate"
RECIPE.description = "Fashion ceramic and steel plates into a useful armor reinforcement."
RECIPE.model = "models/weapons/w_suitcase_passenger.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["steel"] = 5,
	["screws"] = 5,
	["ceramic"] = 4,
	["cloth"] = 4,
	["adhesive"] = 4,
}

RECIPE.results = {
	["combatplateupgrade"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetSkill("repair", 0) < 45) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



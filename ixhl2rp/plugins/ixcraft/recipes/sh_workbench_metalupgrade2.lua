RECIPE.name = "Rebar Reinforcement"
RECIPE.description = "Form steel rebar into extra reinforcement for an armor suit."
RECIPE.model = "models/weapons/w_suitcase_passenger.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["steel"] = 4,
	["screws"] = 4,
	["adhesive"] = 3,
}

RECIPE.results = {
	["metalupgrade2"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetSkill("repair", 0) < 25) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



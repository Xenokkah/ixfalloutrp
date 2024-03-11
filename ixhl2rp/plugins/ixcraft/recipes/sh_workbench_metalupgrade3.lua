RECIPE.name = "Crude Plates"
RECIPE.description = "Fashion steel and aluminium into steel plates to reinforce a suit of armor with."
RECIPE.model = "models/weapons/w_suitcase_passenger.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["steel"] = 4,
	["screws"] = 4,
	["aluminium"] = 4,
	["adhesive"] = 4,
}

RECIPE.results = {
	["metalupgrade3"] = 1
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



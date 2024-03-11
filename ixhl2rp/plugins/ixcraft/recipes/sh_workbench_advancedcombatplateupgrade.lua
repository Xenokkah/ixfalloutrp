RECIPE.name = "Advanced Combat Plate"
RECIPE.description = "Fashion a set of composite armor plates using a method developed by the Shi."
RECIPE.model = "models/weapons/w_suitcase_passenger.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["screws"] = 3,
	["ceramic"] = 4,
	["cloth"] = 4,
	["aluminium"] = 4,
	["copper"] = 2,
	["lead"] = 2,
	["rubber"] = 2,
	["adhesive"] = 4,
}

RECIPE.results = {
	["advancedcombatplateupgrade"] = 1
}

RECIPE.blueprint = "advancedcombatplateblueprint"


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



RECIPE.name = "Asbestos Lining"
RECIPE.description = "Create a suit lining made of Asbestos, which is known for its great resistance to heat and absoloutely nothing else."
RECIPE.model = "models/weapons/w_suitcase_passenger.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["cloth"] = 2,
	["asbestos"] = 3,
	["adhesive"] = 3,
}

RECIPE.results = {
	["leatherupgrade2"] = 1
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



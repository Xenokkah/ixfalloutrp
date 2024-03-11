RECIPE.name = "Sheet Metal Backing"
RECIPE.description = "Fashion a simple sheet metal backing that can toughen a suit against physical blows."
RECIPE.model = "models/weapons/w_suitcase_passenger.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["steel"] = 2,
	["screws"] = 2,
	["adhesive"] = 2,
}

RECIPE.results = {
	["metalupgrade1"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetSkill("repair", 0) < 15) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



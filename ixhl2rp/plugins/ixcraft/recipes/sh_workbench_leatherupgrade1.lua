RECIPE.name = "Leather Backing"
RECIPE.description = "Fashion a leather backing layer to affix to an armor to improve its heat dispersion capability a little."
RECIPE.model = "models/weapons/w_suitcase_passenger.mdl"
RECIPE.category = "Armor"
RECIPE.requirements = {
	["cloth"] = 2,
	["leather"] = 2,
	["adhesive"] = 2,
}

RECIPE.results = {
	["leatherupgrade1"] = 1
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



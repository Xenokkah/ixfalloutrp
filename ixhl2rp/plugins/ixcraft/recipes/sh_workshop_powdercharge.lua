RECIPE.name = "Powder Charge"
RECIPE.description = "Adjust a tin can grenade to have a proximity ignition fuse."
RECIPE.model = "models/halokiller38/fallout/weapons/mines/powderchargemine.mdl"
RECIPE.category = "Explosives"
RECIPE.requirements = {
	["adhesive"] = 1,
	["tincangrenade"] = 1,
	["circuitry"] = 1

}

RECIPE.results = {
	["powdercharge"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("explosives", 0) < 15) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



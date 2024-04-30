RECIPE.name = "Fire Bottle"
RECIPE.description = "Assemble a makeshift inciendiary grenade."
RECIPE.model = "models/halokiller38/fallout/weapons/explosives/firebomb.mdl"
RECIPE.category = "Explosives"
RECIPE.requirements = {
	["emptybottle"] = 1,
	["cloth"] = 1,
	["turpentine"] = 1

}

RECIPE.results = {
	["firebottle"] = 1
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



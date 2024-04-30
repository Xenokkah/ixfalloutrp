RECIPE.name = "Homemade Dyanmite"
RECIPE.description = "Who needs science when you've got a crapton of fertilizer and a reckless disregard for your own safety?"
RECIPE.model = "models/halokiller38/fallout/weapons/explosives/longfusedynamite.mdl"
RECIPE.category = "Explosives"
RECIPE.requirements = {
	["fertilizer"] = 4,
	["wood"] = 3,
	["adhesive"] = 2,
	["cloth"] = 1,

}

RECIPE.results = {
	["dynamite"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("explosives", 0) < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



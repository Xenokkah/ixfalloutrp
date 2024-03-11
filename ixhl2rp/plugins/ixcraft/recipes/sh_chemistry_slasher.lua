RECIPE.name = "Slasher"
RECIPE.description = "Mix a dosage of Psycho with ingredients holding potent pain-killing effects."
RECIPE.model = "models/fnv/clutter/health/psychochem01.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["stimpak"] = 2,
	["psycho"] = 1,
	["yucca"] = 2,
}

RECIPE.results = {
	["slasher"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 25) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



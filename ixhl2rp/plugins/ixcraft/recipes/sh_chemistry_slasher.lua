RECIPE.name = "Slasher"
RECIPE.description = "Produce a dosage of Stimpak with some common herbs, but properly refined and injected directly into the body instead of applied externally to a wound."
RECIPE.model = "models/mosi/fnv/props/health/stimpak.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["stimpak"] = 2,
	["psycho"] = 1,
	["yucca"] = 2,
}

RECIPE.results = {
	["slasher"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



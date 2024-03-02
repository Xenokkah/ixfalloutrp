RECIPE.name = "Stimpak"
RECIPE.description = "Produce a dosage of Stimpak with some common herbs, but properly refined and injected directly into the body instead of applied externally to a wound."
RECIPE.model = "models/mosi/fnv/props/health/stimpak.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["emptysyringe"] = 1,
	["brocflower"] = 1,
	["xanderroot"] = 1,
}

RECIPE.results = {
	["stimpak"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("medicine", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



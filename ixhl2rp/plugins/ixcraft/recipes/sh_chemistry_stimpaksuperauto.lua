RECIPE.name = "Auto-Inject Super Stimpak"
RECIPE.description = "Attach some electronics to a super stim to make it automatically inject when the user is critically wounded. Requires careful circuitry work and timing so as not to overdose the patient."
RECIPE.model = "models/mosi/fnv/props/health/superstimpak_auto.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["stimpaksuper"] = 1,
	["circuitry"] = 2,
	["adhesive"] = 2,
	["gold"] = 1,
	["copper"] = 1,
	
}

RECIPE.results = {
	["stimpaksuperauto"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("medicine", 0) < 50) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



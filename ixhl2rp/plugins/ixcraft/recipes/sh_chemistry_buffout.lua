RECIPE.name = "Buffout"
RECIPE.description = "A pre war steroid often used by athletes to enhance their physical performance. Abuse tends to result in heart problems.\n+2 END\n+2 STR\n+25 Temporary HP"
RECIPE.model = "models/mosi/fnv/props/health/chems/mentats.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["lead"] = 1,
	["cavefungus"] = 2,
	["xanderroot"] = 2,
	["whitehorsenettle"] = 2,
	
}

RECIPE.results = {
	["buffout"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 30) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



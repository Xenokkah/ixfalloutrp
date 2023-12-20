RECIPE.name = "Party Time Mentats"
RECIPE.description = "Mix a dose of Mentats with other ingredients for an improved recipe that increases one's natural Charisma, but for a much shorter period."
RECIPE.model = "models/mosi/fnv/props/health/chems/mentats.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["mentats"] = 1,
	["honeymesquitepod"] = 1,
	["whiskey"] = 1,

	
}

RECIPE.results = {
	["partytimementats"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



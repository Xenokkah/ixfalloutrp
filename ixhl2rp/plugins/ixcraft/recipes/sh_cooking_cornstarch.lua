RECIPE.name = "Adhesive From Maize"
RECIPE.description = "Process some ears of Maize into a sticky starch."
RECIPE.model = "models/mosi/fallout4/props/junk/components/adhesive.mdl"
RECIPE.category = "Plant Material"
RECIPE.requirements = {
	["maize"] = 2,
}

RECIPE.results = {
	["adhesive"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
end)



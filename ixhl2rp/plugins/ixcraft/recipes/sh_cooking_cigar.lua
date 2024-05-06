RECIPE.name = "Cigar"
RECIPE.description = "Hand-roll a cigar with some leather, for the wrapping, and a bit more tobacco."
RECIPE.model = "models/mosi/fallout4/props/junk/cigarette.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["leather"] = 1,
	["coyotetobaccochew"] = 2,
}

RECIPE.results = {
	["cigar"] = 1
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



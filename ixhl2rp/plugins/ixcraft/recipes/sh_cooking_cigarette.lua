RECIPE.name = "Cigarette"
RECIPE.description = "Hand-roll a cigarette with some paper and dried tobacco."
RECIPE.model = "models/mosi/fallout4/props/junk/cigarette.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["paper"] = 1,
	["coyotetobaccochew"] = 1,
}

RECIPE.results = {
	["cigarette"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



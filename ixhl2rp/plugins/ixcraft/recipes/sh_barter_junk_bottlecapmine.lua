RECIPE.name = "Bottlecap Mine"
RECIPE.description = "Exchange a useful machine part often used for auto-docs, for a potent explosive mine."
RECIPE.model = "models/mosi/fallout4/props/junk/tincan03.mdl"
RECIPE.category = "Junkers"
RECIPE.requirements = {
	["biometricscanner"] = 1	
}

RECIPE.results = {
	["bottlecapmine"] = 2,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("barter", 0) < 30) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_tradingpost")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



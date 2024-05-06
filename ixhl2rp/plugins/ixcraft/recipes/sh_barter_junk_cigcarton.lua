RECIPE.name = "Cigarette Carton"
RECIPE.description = "Exchange a blowtorch for a carton of cig packs."
RECIPE.model = "models/mosi/fallout4/props/junk/cigarettecarton.mdl"
RECIPE.category = "Junkers"
RECIPE.requirements = {
	["blowtorch"] = 1	
}

RECIPE.results = {
	["cigcarton"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("barter", 0) < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_tradingpost")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



RECIPE.name = "Gun Oil"
RECIPE.description = "Exchange a homemade battery for some gun oil."
RECIPE.model = "models/mosi/fallout4/props/junk/cookingoil.mdl"
RECIPE.category = "Junkers"
RECIPE.requirements = {
	["homemadebattery"] = 1	
}

RECIPE.results = {
	["gunoil"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("barter", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_tradingpost")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



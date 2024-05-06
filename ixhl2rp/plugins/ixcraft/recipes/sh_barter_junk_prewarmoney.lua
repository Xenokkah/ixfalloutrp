RECIPE.name = "Pre-War Money"
RECIPE.description = "Exchange a replacement fuse for pre-war money good for buying from old machines with."
RECIPE.model = "models/mosi/fallout4/props/junk/prewarmoney.mdl"
RECIPE.category = "Junkers"
RECIPE.requirements = {
	["fuse"] = 1	
}

RECIPE.results = {
	["prewarmoney"] = 1
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



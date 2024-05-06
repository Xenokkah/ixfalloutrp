RECIPE.name = "Adhesive Shipment"
RECIPE.description = "Exchange a bottle of antifreeze for 5 portions of adhesive."
RECIPE.model = "models/mosi/fallout4/props/junk/components/adhesive.mdl"
RECIPE.category = "Junkers"
RECIPE.requirements = {
	["antifreeze"] = 1	
}

RECIPE.results = {
	["adhesive"] = 5
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



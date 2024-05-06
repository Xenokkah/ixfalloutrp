RECIPE.name = "Energy Ammo"
RECIPE.description = "Exchange a Fusion Core for more personally usable energy ammo."
RECIPE.model = "models/mosi/fallout4/ammo/microfusioncell.mdl"
RECIPE.category = "Junkers"
RECIPE.requirements = {
	["fusioncore"] = 1	
}

RECIPE.results = {
	["ammo_mfcammo"] = 2,
	["ammo_ecpammo"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("barter", 0) < 40) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_tradingpost")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



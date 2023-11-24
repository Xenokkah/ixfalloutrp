RECIPE.name = ".50 MG"
RECIPE.description = "Hand-load some .50 MG."
RECIPE.model = "models/mosi/fallout4/ammo/50.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["leadcan"] = 3,
	["casing50mg"] = 1,
	["powderrifle"] = 3,
	["primerlargerifle"] = 3,
}

RECIPE.results = {
	["ammo_50mgammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetRepair() < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end
	return false
end)



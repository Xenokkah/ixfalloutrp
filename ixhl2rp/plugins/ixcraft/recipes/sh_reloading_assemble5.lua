RECIPE.name = "5mm"
RECIPE.description = "Hand-load some 5mm."
RECIPE.model = "models/mosi/fallout4/ammo/wildcat.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["leadcan"] = 2,
	["casingsmallrifle"] = 2,
	["powderrifle"] = 2,
	["primersmallrifle"] = 2,
}

RECIPE.results = {
	["ammo_5mmammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetRepair() < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end
	return false
end)



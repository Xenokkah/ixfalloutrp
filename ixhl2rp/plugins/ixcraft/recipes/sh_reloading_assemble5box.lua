RECIPE.name = "5mm Box"
RECIPE.description = "Link several 5mm boxes into a belt so it can be used in certain heavy weaponry."
RECIPE.model = "models/mosi/fallout4/ammo/5mm.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_5mmammo"] = 4
}

RECIPE.results = {
	["ammo_5mmboxammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetRepair() < 50) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	return false
end)



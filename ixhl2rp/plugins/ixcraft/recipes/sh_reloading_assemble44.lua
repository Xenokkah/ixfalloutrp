RECIPE.name = ".44 Magnum"
RECIPE.description = "Hand-load some .44 Magnum."
RECIPE.model = "models/mosi/fallout4/ammo/44.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["leadcan"] = 2,
	["casinglargepistol"] = 1,
	["powderpistol"] = 2,
	["primerlargepistol"] = 2,
}

RECIPE.results = {
	["ammo_44magnumammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	return false
end)



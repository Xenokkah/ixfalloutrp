RECIPE.name = ".45 ACP"
RECIPE.description = "Hand-load some .45 ACP."
RECIPE.model = "models/mosi/fallout4/ammo/45.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["leadcan"] = 1,
	["casingsmallpistol"] = 1,
	["powderpistol"] = 1,
	["primersmallpistol"] = 1,
}

RECIPE.results = {
	["ammo_45autoammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	return false
end)



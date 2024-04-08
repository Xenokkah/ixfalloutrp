RECIPE.name = "20 Gauge Slug"
RECIPE.description = "Hand-load some 20 gauge solid slug."
RECIPE.model = "models/mosi/fallout4/ammo/shotgunshells.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["leadcan"] = 2,
	["casingshotgun"] = 1,
	["powderpistol"] = 2,
	["primersmallpistol"] = 2,
}

RECIPE.results = {
	["ammo_20gaugeammo_alt"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 15) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end
	return false
end)



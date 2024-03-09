RECIPE.name = ".357 Magnum Breakdown"
RECIPE.description = "Disassemble some .357 Magnum."
RECIPE.model = "models/mosi/fallout4/ammo/38.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_357magnumammo"] = 1
}

RECIPE.results = {
	["leadcan"] = 1,
	["casinglargepistol"] = 1,
	["powderpistol"] = 2,
	["primerlargepistol"] = 2,
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



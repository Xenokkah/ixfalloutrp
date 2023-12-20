RECIPE.name = "10mm Breakdown"
RECIPE.description = "Disassemble some 10mm."
RECIPE.model = "models/mosi/fallout4/ammo/10mm.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_45autoammo"] = 1
}

RECIPE.results = {
	["leadcan"] = 2,
	["casinglargepistol"] = 1,
	["powderpistol"] = 1,
	["primerlargepistol"] = 1,
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end
	return false
end)



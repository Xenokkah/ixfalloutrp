RECIPE.name = "Disassemble 5mm Box"
RECIPE.description = "Unlink 5mm rounds from a belt and box them up for use in conventional weapons."
RECIPE.model = "models/mosi/fallout4/ammo/5mm.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_5mmboxammo"] = 1
}

RECIPE.results = {
	["ammo_5mmammo"] = 4
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_reloadingbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end
	return false
end)



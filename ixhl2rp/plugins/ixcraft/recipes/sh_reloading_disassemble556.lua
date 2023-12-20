RECIPE.name = "5.56"
RECIPE.description = "Disassemble some 5.56."
RECIPE.model = "models/mosi/fallout4/ammo/556.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_556ammo"] = 1
}

RECIPE.results = {
	["leadcan"] = 1,
	["casingsmallrifle"] = 1,
	["powderrifle"] = 1,
	["primersmallrifle"] = 1,
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



RECIPE.name = ".308 Breakdown"
RECIPE.description = "Disassemble some .308."
RECIPE.model = "models/mosi/fallout4/ammo/308.mdl"
RECIPE.category = "Ammo"
RECIPE.requirements = {
	["ammo_308ammo"] = 1
}

RECIPE.results = {
	["leadcan"] = 2,
	["casinglargerifle"] = 1,
	["powderrifle"] = 2,
	["primerlargerifle"] = 2,

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



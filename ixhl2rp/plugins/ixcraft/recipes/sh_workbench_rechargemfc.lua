RECIPE.name = "Recharge Microfusion Cell"
RECIPE.description = "Squeeze the last bit of juice out of some Microfusion Cells, plus some acid to replace the missing battery acid, to create one fully charged cell."
RECIPE.model = "models/mosi/fallout4/ammo/microfusioncell.mdl"
RECIPE.category = "Energy Ammo"
RECIPE.requirements = {
	["drainedmfc"] = 4,
	["acid"] = 1,

}

RECIPE.results = {
	["ammo_mfcammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 15) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



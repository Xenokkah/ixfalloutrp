RECIPE.name = "Microfusion Cell, Over Charge"
RECIPE.description = "Charge one MFC beyond normal capacity for a more powerful beam using the power from several normal cells."
RECIPE.model = "models/mosi/fallout4/ammo/microfusioncell.mdl"
RECIPE.category = "Energy Ammo"
RECIPE.requirements = {
	["ammo_mfcammo"] = 3

}

RECIPE.results = {
	["ammo_mfcammo_alt"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



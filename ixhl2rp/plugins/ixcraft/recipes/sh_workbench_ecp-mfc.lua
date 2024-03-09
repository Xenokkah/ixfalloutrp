RECIPE.name = "Convert ECP to MFC"
RECIPE.description = "Convert the power stored in some Electron Charge Packs to a Microfusion Cell, a battery often used in semi-auto energy weapons that provides a stronger beam but a smaller capacity."
RECIPE.model = "models/mosi/fallout4/ammo/microfusioncell.mdl"
RECIPE.category = "Energy Ammo"
RECIPE.requirements = {
	["ammo_ecpammo"] = 3

}

RECIPE.results = {
	["ammo_mfcammo"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



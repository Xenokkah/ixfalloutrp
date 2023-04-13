RECIPE.name = "Convert MFC to ECP"
RECIPE.description = "Convert the power stored in Microfusion Cells to Electron Charge Packs, a battery often used in automatic energy guns as it provides higher capacity but a less intense beam."
RECIPE.model = "models/fallout new vegas/electron_charge_pack.mdl"
RECIPE.category = "Energy Ammo"
RECIPE.requirements = {
	["ammo_mfcammo"] = 1

}

RECIPE.results = {
	["ammo_ecpammo"] = 3
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetRepair() < 50) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
	
end)



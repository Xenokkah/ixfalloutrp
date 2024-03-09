RECIPE.name = "Recharge Electron Charge Pack"
RECIPE.description = "Squeeze the last bit of juice out of some Electron Charge Packs, plus some acid to replace the missing battery acid, to create one fully charged cell."
RECIPE.model = "models/fallout new vegas/electron_charge_pack.mdl"
RECIPE.category = "Energy Ammo"
RECIPE.requirements = {
	["drainedecp"] = 4,
	["acid"] = 1,

}

RECIPE.results = {
	["ammo_ecpammo"] = 1
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



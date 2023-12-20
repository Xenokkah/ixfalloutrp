RECIPE.name = "Recharge Electron Charge Pack, Efficent"
RECIPE.description = "Make use of a recycling guide to make a fresh ECP with one less cell."
RECIPE.model = "models/fallout new vegas/electron_charge_pack.mdl"
RECIPE.category = "Energy Ammo"
RECIPE.requirements = {
	["drainedecp"] = 3,
	["acid"] = 1,

}

RECIPE.results = {
	["ammo_ecpammo"] = 1
}

RECIPE.blueprint = "blueprintmfcefficent"


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



RECIPE.name = "Recharge Microfusion Cell, Efficent"
RECIPE.description = "Make use of a recycling guide to make a fresh MFC with one less cell."
RECIPE.model = "models/mosi/fallout4/ammo/microfusioncell.mdl"
RECIPE.category = "Energy Ammo"
RECIPE.requirements = {
	["drainedmfc"] = 3,
	["acid"] = 1,

}

RECIPE.results = {
	["ammo_mfcammo"] = 1
}

RECIPE.blueprint = "blueprintmfcefficent"


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetRepair() < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



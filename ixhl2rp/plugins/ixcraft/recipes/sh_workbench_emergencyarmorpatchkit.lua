RECIPE.name = "Emergency Armor Patch Kit"
RECIPE.description = "Assemble a kit of adhesive patches used for repairing simple damage on a piece of armor. "
RECIPE.model = "models/mosi/fallout4/props/junk/modcrate.mdl"
RECIPE.category = "Energy Ammo"
RECIPE.requirements = {
	["adhesive"] = 1,
	["cloth"] = 1,

}

RECIPE.results = {
	["emergencyarmorpatchkit"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



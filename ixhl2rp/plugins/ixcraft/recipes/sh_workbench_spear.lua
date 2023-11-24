RECIPE.name = "Spear"
RECIPE.description = "Fashion a wooden shaft with a sharp piece of metal on the end. Not the strongest but good for keeping enemies at arms length."
RECIPE.model = "models/mosi/fallout4/props/weapons/melee/poolcue.mdl"
RECIPE.category = "Melee Weapons"
RECIPE.requirements = {
	["wood"] = 2,
	["adhesive"] = 1,
	["steel"] = 1

}

RECIPE.results = {
	["spear"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



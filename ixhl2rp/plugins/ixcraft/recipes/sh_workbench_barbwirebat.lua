RECIPE.name = "Barbed Wire Wooden Bat"
RECIPE.description = "Bang some nails into a wooden baseball bat to draw more blood."
RECIPE.model = "models/mosi/fallout4/props/weapons/melee/baseballbat.mdl"
RECIPE.category = "Melee Weapons"
RECIPE.requirements = {
	["woodbat"] = 1,
	["steel"] = 2,
	["adhesive"] = 2

}

RECIPE.results = {
	["barbwirewoodbat"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
	
end)



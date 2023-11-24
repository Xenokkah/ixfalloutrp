RECIPE.name = "Razor Metal Bat"
RECIPE.description = "Carefully circle many steel razors around a metal bat for superb ultraviolence."
RECIPE.model = "models/mosi/fallout4/props/weapons/melee/baseballbat.mdl"
RECIPE.category = "Melee Weapons"
RECIPE.requirements = {
	["metalbat"] = 1,
	["steel"] = 5,
	["adhesive"] = 3,
	["screws"] = 2

}

RECIPE.results = {
	["razormetalbat"] = 1
}


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



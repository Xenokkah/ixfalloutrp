RECIPE.name = "Chain Metal Bat"
RECIPE.description = "Bolt on some chains around a metal bat for some extra oomf."
RECIPE.model = "models/mosi/fallout4/props/weapons/melee/baseballbat.mdl"
RECIPE.category = "Melee Weapons"
RECIPE.requirements = {
	["metalbat"] = 1,
	["steel"] = 2,
	["adhesive"] = 2,
	["screws"] = 1

}

RECIPE.results = {
	["chainedmetalbat"] = 1
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



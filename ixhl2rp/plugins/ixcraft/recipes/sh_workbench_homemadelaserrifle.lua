RECIPE.name = "Homemade Laser Rifle"
RECIPE.description = "With some know-how regarding existing laser technology, you can make your own single-shot rifle using lower power but homemade laser canisters."
RECIPE.model = "models/illusion/fwp/w_lasermusket.mdl"
RECIPE.category = "Energy Weapons"
RECIPE.requirements = {
	["steel"] = 3,
	["adhesive"] = 3,
	["screws"] = 2,	
	["gears"] = 2,	
	["glass"] = 2,	
	["crystal"] = 2,	
	["nuclearmaterial"] = 1,	
	["circuitry"] = 1,	
	["copper"] = 1,	
}

RECIPE.results = {
	["homemadelaserrifle"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetSkill("science", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



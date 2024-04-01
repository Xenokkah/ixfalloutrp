RECIPE.name = "Homemade Laser Pistol"
RECIPE.description = "With some know-how regarding existing laser technology, you can make a low-wattage sidearm that taps into homemade laser ammo."
RECIPE.model = "models/destiny/props/lasrev.mdl"
RECIPE.category = "Energy Weapons"
RECIPE.requirements = {
	["steel"] = 2,
	["adhesive"] = 2,
	["screws"] = 1,	
	["gears"] = 1,	
	["glass"] = 1,	
	["crystal"] = 1,	
	["nuclearmaterial"] = 1,	
	["circuitry"] = 1,	
	["copper"] = 1,	
}

RECIPE.results = {
	["homemadelaserpistol"] = 1
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



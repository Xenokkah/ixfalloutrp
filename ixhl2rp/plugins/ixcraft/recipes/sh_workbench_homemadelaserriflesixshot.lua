RECIPE.name = "Homemade Laser Rifle Six Shot Capacitor"
RECIPE.description = "Improve the effiency of a homemade laser rifle's rather crude capacitor, allowing it to fire six times total before needing a reload."
RECIPE.model = "models/illusion/fwp/w_lasermusket.mdl"
RECIPE.category = "Energy Weapons"
RECIPE.requirements = {
	["steel"] = 2,
	["adhesive"] = 2,
	["nuclearmaterial"] = 2,	
	["circuitry"] = 3,	
	["gold"] = 1,	
	["copper"] = 1,	
	["ceramic"] = 1,	
}

RECIPE.results = {
	["sixshothomemadelaserrifle"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetScience() < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



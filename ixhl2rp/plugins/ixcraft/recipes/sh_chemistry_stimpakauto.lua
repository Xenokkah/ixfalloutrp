RECIPE.name = "Auto Inject Stimpak"
RECIPE.description = "Attach some sensing equipment and a leather brace to allow a regular stimpak to work automatically when its needed."
RECIPE.model = "models/mosi/fnv/props/health/stimpak_auto.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["stimpak"] = 1,
	["circuitry"] = 2,
	["adhesive"] = 2,
	["leather"] = 1,
	["copper"] = 1,
}

RECIPE.results = {
	["stimpakauto"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetScience() < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



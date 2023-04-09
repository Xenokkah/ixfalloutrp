RECIPE.name = "Healing Poultice"
RECIPE.description = "Create a pouch of Healing Poultice."
RECIPE.model = "models/mosi/fnv/props/health/healingpowder.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["xanderroot"] = 2,
	["brocflower"] = 2,
	["nevadaagave"] = 2,
	["cavefungus"] = 2,
}

RECIPE.results = {
	["healingpoultice"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSurvival() <= 50) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
end)



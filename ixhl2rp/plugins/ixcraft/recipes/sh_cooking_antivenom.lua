RECIPE.name = "Antivenom"
RECIPE.description = "Mix up a dose of antivenom."
RECIPE.model = "models/mosi/fnv/props/health/antivenom.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["radscorpionvenomgland"] = 2,
	["barrelcactus"] = 1,
}

RECIPE.results = {
	["antivenom"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSurvival() < 25) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end

	return false
	
end)



RECIPE.name = "Hydra"
RECIPE.description = "Create a dose of Hydra."
RECIPE.model = "models/mosi/fnv/props/health/chems/hydra.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["radscorpionvenomgland"] = 2,
	["nightstalkerblood"] = 2,
	["cavefungus"] = 1,
}

RECIPE.results = {
	["hydra"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
end)



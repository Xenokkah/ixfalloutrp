RECIPE.name = "Hydra"
RECIPE.description = "A soda bottle with three seperate glass vials leading to its mouth via tube, hence the name. Provides effective pain relief over time. Despite having some addictive properties, the Legion does not consider it a banned drug and often issues it to its soldiers - but it's equally valued by anybody else without the luxury of Med-X access. \n\n+5 HP\n+30 Temporary HP."
RECIPE.model = "models/mosi/fnv/props/health/chems/hydra.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["cavefungus"] = 1,
	["radscorpionvenomgland"] = 1,
	["nightstalkerblood"] = 2,

}

RECIPE.results = {
	["hydra"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 30) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



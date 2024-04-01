RECIPE.name = "Psycho"
RECIPE.description = "The choice Chem between raiders, fiends, and everyone in between when something needs killing. Its ability to spike aggression while dampening pain is coveted among these ne’re-do-wells. It’s a large syringe with canisters strapped on either side of it with wires running to the top and needle end of the syringe."
RECIPE.model = "models/mosi/fnv/props/health/chems/psycho.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["circuitry"] = 2,
	["stimpak"] = 1,
	["acid"] = 2,
["brocflower"] = 2,

	
}

RECIPE.results = {
	["psycho"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 25) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



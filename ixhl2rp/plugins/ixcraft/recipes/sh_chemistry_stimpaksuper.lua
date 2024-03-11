RECIPE.name = "Super Stimpak"
RECIPE.description = "Produce a dose of 'Super' Stimpak, an improved version that does however have some side effects. Requires a leather brace to keep in place while it injects."
RECIPE.model = "models/mosi/fnv/props/health/superstimpak.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["stimpak"] = 1,
	["nukacola"] = 1,
	["mutfruit"] = 1,
	["adhesive"] = 1,
	["leather"] = 1,
}

RECIPE.results = {
	["stimpaksuper"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("medicine", 0) < 40) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



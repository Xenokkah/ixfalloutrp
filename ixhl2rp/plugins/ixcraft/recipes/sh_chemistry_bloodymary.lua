RECIPE.name = "Bloody Mary"
RECIPE.description = "A local Chem that has only recently started circulating in Mesquite. It seems to be a Psycho derivative, causing mind numbing fits of rage for users, but has the side effects of uncontrollable sudden and jerky movements along with minor respiratory bleeding, from which its name comes from. It’s often used as a cheaper alternative to the real stuff by low lifes."
RECIPE.model = "models/mosi/fnv/props/health/chems/psycho.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["circuitry"] = 1,
	["stimpak"] = 1,
	["acid"] = 1,
	["antifreeze"] = 1,

	
}

RECIPE.results = {
	["bloodymary"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



RECIPE.name = "Turbo"
RECIPE.description = "Mix a dose of Jet with some other nasty inhalants for a more effective drug."
RECIPE.model = "models/mosi/fnv/props/health/chems/turbo.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["jet"] = 1,
	["brocflower"] = 1,
	["turpentine"] = 1,
	["cazadorpoisongland"] = 1,
	
}

RECIPE.results = {
	["turbo"] = 1
	

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



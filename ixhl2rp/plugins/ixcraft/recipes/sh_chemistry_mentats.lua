RECIPE.name = "Mentats"
RECIPE.description = "A metallic tin full of tablets, with a mixture scientifically proven to sharpen the senses and increase the mind's comprehension. Favored by intellectuals needing the boost to power through their next breakthrough.\n+2 INT\n+2 PER\n+1 CHR"
RECIPE.model = "models/mosi/fnv/props/health/chems/mentats.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["abraxo"] = 1,
	["cavefungus"] = 2,
	["lead"] = 1,
	
}

RECIPE.results = {
	["mentats"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 15) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



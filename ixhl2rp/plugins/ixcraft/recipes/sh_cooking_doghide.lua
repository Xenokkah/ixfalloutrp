RECIPE.name = "Leather from Dog Hide"
RECIPE.description = "Tan some dog hides to make some usable leather."
RECIPE.model = "models/mosi/fallout4/props/junk/components/leather.mdl"
RECIPE.category = "Tanning"
RECIPE.requirements = {
	["doghide"] = 2,
	["whitehorsenettle"] = 1,
	["turpentine"] = 1,
}

RECIPE.results = {
	["leather"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
end)



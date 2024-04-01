RECIPE.name = "Cloth From Corn Silk"
RECIPE.description = "Stitch the fibers from the silky-like materials in an ear of corn into usable cloth."
RECIPE.model = "models/mosi/fallout4/props/junk/components/cloth.mdl"
RECIPE.category = "Plant Material"
RECIPE.requirements = {
	["maize"] = 1,
}

RECIPE.results = {
	["cloth"] = 1
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



RECIPE.name = "Antiseptic From White Horsenettle"
RECIPE.description = "While poisonous to eat, White Horsenettle berries have a potent germ-killing effect."
RECIPE.model = "models/mosi/fallout4/props/junk/components/antiseptic.mdl"
RECIPE.category = "Plant Material"
RECIPE.requirements = {
	["whitehorsenettle"] = 2,
}

RECIPE.results = {
	["antiseptic"] = 1
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



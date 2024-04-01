RECIPE.name = "Barrel Cactus Water"
RECIPE.description = "Extract clean water from some Barrel Cactus."
RECIPE.model = "models/mosi/fnv/props/drink/water_clean.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["emptybottle"] = 1,
	["barrelcactus"] = 2,
}

RECIPE.results = {
	["waterclean"] = 1

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


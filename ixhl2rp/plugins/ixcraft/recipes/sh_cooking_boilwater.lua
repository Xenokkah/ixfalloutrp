RECIPE.name = "Boil Water"
RECIPE.description = "Extract clean water from Prickly Pear Fruit."
RECIPE.model = "models/mosi/fallout4/props/drink/dirtywater.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["waterdirty"] = 1,
}

RECIPE.results = {
	["waterboiled"] = 1

}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false

end)


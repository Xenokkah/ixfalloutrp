RECIPE.name = "Healing Powder"
RECIPE.description = "Create a pouch of healing powder with some common herbs, to the best of your ability."
RECIPE.model = "models/mosi/fnv/props/health/healingpowder.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["xanderroot"] = 2,
	["brocflower"] = 2,
}

RECIPE.results = {
	["healingpowder"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false

end)



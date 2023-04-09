RECIPE.name = "Bitter Drink"
RECIPE.description = "With a sacred recipe in hand, brew a potent drink that scours the body of pain and injury, leaving behind a bitter taste."
RECIPE.model = "models/mosi/fnv/props/health/healingpowder.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["xanderroot"] = 1,
	["brocflower"] = 1,
	["waterclean"] = 1,
	["emptybottle"] = 1,
}

RECIPE.results = {
	["bitterdrink"] = 1
}

RECIPE.blueprint = "blueprintbitterdrink"


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSurvival() < 25) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 100) then
			return true
		end
	end
	
	return false
end)



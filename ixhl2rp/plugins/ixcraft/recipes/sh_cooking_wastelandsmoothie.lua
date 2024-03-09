RECIPE.name = "Wasteland Smoothie"
RECIPE.description = "Mix up a few cans worth of a delicious smoothie from milk and fruit."
RECIPE.model = "models/mosi/fnv/props/drink/boatfly_smoothie.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["brahminmilk"] = 1,
	["apple"] = 1,
	["mutfruit"] = 1,
	["pricklypear"] = 1,
	["nevadaagave"] = 1,
	["tincan"] = 3
}

RECIPE.results = {
	["wastelandsmoothie"] = 3
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) <= 15) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
end)



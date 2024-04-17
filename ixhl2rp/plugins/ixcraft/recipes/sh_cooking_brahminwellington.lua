RECIPE.name = "Brahmin Wellington"
RECIPE.description = "Prepare a Brahmin Wellington. Time consuming and difficult to produce, few meals can match this wasteland delight."
RECIPE.model = "models/mosi/fallout4/props/food/deathclawsouffle.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["brahminmeatraw"] = 1,
	["antegg"] = 1,
	["blamcomacncheese"] = 1,
}

RECIPE.results = {
	["brahminwellington"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 40) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	

	return false
end)

RECIPE.name = "Donut Bites"
RECIPE.description = "Bake some fresh sugary donuts, from Slocum's Joe's origonal blueprint!... With some 'modern' substitutions."
RECIPE.model = "models/mosi/fallout4/props/food/slocumsbuzzbites.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["brahminmilk"] = 1,
	["flour"] = 1,
	["honeymesquitepod"] = 1,
	["yumyumeggs"] = 1,
}

RECIPE.results = {
	["donutbites"] = 1
}

RECIPE.blueprint = "slocumblueprint"


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
end)



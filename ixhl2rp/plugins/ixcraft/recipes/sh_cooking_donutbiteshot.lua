RECIPE.name = "Buzz Bites"
RECIPE.description = "Bake some fresh sugary donuts with piping hot coffee filling, there is no way that could be a bad idea! From Slocum's Joe's origonal blueprint!... With some 'modern' substitutions."
RECIPE.model = "models/mosi/fallout4/props/food/slocumsbuzzbites.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["brahminmilk"] = 1,
	["flour"] = 1,
	["honeymesquitepod"] = 1,
	["yumyumeggs"] = 1,
	["blackcoffee"] = 1,
}

RECIPE.results = {
	["donutbiteshot"] = 1
}

RECIPE.blueprint = "slocumblueprint"


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



RECIPE.name = "Caravan Lunch - Junker Trade"
RECIPE.description = "Exchange some machine parts for some food."
RECIPE.model = "models/mosi/fnv/props/food/lunchbox_meal.mdl"
RECIPE.category = "Junker Trade"
RECIPE.requirements = {
	["steel"] = 3,
	["screws"] = 2,
	["gears"] = 2,

	
}

RECIPE.results = {
	["caravanlunch"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("barter", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_tradingpost")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



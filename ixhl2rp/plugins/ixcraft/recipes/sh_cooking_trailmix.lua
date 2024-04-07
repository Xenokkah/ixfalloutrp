RECIPE.name = "Trail Mix"
RECIPE.description = "Combine some ingredients into trail mix."
RECIPE.model = "models/mosi/fnv/props/junk/lunchbox.mdl"
RECIPE.category = "Food"
RECIPE.requirements = {
	["pear"] = 1,
	["apple"] = 1,
	["pinyonnuts"] = 1,
	["sugarbombs"] = 1,
}

RECIPE.results = {
	["trailmix"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 20) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
end)

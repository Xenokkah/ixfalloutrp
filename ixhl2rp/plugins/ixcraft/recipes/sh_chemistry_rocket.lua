RECIPE.name = "Rocket"
RECIPE.description = "An intense variant of jet with highs that can fly you to space and lows that crash you back down to Earth. It’s a potent Chem that any Jet addict would seek."
RECIPE.model = "models/fallout/clutter/chems/jet.mdl"
RECIPE.category = "Chems"
RECIPE.requirements = {
	["abraxo"] = 2,
	["jet"] = 1,
	["nukacola"] = 2,

}

RECIPE.results = {
	["rocket"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("science", 0) < 40) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_chemistryset")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



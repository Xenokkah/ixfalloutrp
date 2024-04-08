RECIPE.name = "Bobby Pins"
RECIPE.description = "Bend and twist a bit of metal into some usable bobbypins."
RECIPE.model = "models/mosi/fallout4/props/junk/bobbypinbox.mdl"
RECIPE.category = "Misc"
RECIPE.requirements = {
	["steel"] = 2,
}

RECIPE.results = {
	["bobbypins"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetSkill("lockpicking", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



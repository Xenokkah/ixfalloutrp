RECIPE.name = "Fiery Purgative"
RECIPE.description = "Create a pouch of Fiery Purgative, that scours the body of harmful substances and radiation."
RECIPE.model = "models/mosi/fnv/props/health/healingpowder.mdl"
RECIPE.category = "Medicine"
RECIPE.requirements = {
	["vodka"] = 1,
	["jalapenopepper"] = 1,
	["whitehorsenettle"] = 1,
}

RECIPE.results = {
	["fierypurgative"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("survival", 0) < 15) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_cookingfire")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
end)



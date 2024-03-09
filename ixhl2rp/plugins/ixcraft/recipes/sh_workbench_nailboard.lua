RECIPE.name = "Nail Board"
RECIPE.description = "Bang some nails into a wooden board for a weapon bound to bring out more blood."
RECIPE.model = "models/mosi/fallout4/props/weapons/melee/board.mdl"
RECIPE.category = "Melee Weapons"
RECIPE.requirements = {
	["board"] = 1,
	["nails"] = 2

}

RECIPE.results = {
	["nailboard"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



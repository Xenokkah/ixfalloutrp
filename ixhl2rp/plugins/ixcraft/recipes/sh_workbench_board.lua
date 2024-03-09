RECIPE.name = "Board"
RECIPE.description = "Break some wood chunks into the very rough shape of a club for smacking stuff with, then wrap one end with tape to make a grip."
RECIPE.model = "models/mosi/fallout4/props/weapons/melee/board.mdl"
RECIPE.category = "Melee Weapons"
RECIPE.requirements = {
	["wood"] = 2,
	["adhesive"] = 1

}

RECIPE.results = {
	["board"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



RECIPE.name = "Pipe Bolt-Action Rifle"
RECIPE.description = "Assemble a slow firing bolt action rifle from wood and scrap with a decent capacity and plenty of upgrade potential."
RECIPE.model = "models/illusion/fwp/w_pipebolt.mdl"
RECIPE.category = "Firearms"
RECIPE.requirements = {
	["gears"] = 2,
	["steel"] = 3,
	["adhesive"] = 4,
	["screws"] = 3,
	["nails"] = 1,
	["wood"] = 2,
	["springs"] = 1,



}

RECIPE.results = {
	["pipeboltactionrifle"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



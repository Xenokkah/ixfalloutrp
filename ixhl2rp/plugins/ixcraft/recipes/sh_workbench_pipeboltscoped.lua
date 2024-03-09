RECIPE.name = "Pipe Bolt-Action Rifle Scoped"
RECIPE.description = "Create a 'scope' and add a longer barrel for a more accurate bolt action pipe gun."
RECIPE.model = "models/illusion/fwp/w_pipeboltscoped.mdl"
RECIPE.category = "Firearms"
RECIPE.requirements = {
	["steel"] = 2,
	["adhesive"] = 2,
	["screws"] = 2,	
	["pipeboltactionrifle"] = 1
}

RECIPE.results = {
	["pipeboltactionriflescoped"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



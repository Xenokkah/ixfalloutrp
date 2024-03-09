RECIPE.name = "Pipe Pistol"
RECIPE.description = "Assemble a six-shot firearm capable of firing low power .38 Special rounds out of pipes and other scrap."
RECIPE.model = "models/illusion/fwp/w_piperevolver.mdl"
RECIPE.category = "Firearms"
RECIPE.requirements = {
	["gears"] = 2,
	["steel"] = 2,
	["adhesive"] = 5,
	["screws"] = 3


}

RECIPE.results = {
	["pipepistol"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



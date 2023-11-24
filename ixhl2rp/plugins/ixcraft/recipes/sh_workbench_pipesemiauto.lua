RECIPE.name = "Semi Automatic Pipe Rifle"
RECIPE.description = "With your better understanding of firearm internals, make your pipe bolt rifle semi-auto by having it cock the rifle after every shot, and add some quality of life features such as a compensator, large mag, and shock absorbing stock."
RECIPE.model = "models/illusion/fwp/w_piperiflesemi.mdl"
RECIPE.category = "Firearms"
RECIPE.requirements = {
	["pipeboltactionriflescoped"] = 1,
	["steel"] = 4,
	["adhesive"] = 3,
	["screws"] = 2,	
	["gears"] = 1,	
	["springs"] = 1,	
}

RECIPE.results = {
	["pipesemiautorifle"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetRepair() < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



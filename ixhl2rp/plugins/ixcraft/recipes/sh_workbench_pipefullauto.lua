RECIPE.name = "Fully Automatic Pipe Rifle"
RECIPE.description = "Make a homemade auto sear and strengthened internal components to allow a semi auto pipe rifle to fire in fully automatic."
RECIPE.model = "models/illusion/fwp/w_piperiflesemi.mdl"
RECIPE.category = "Firearms"
RECIPE.requirements = {
	["pipesemiautorifle"] = 1,
	["steel"] = 2,
	["adhesive"] = 2,
	["screws"] = 2,	
	["springs"] = 2,	
}

RECIPE.results = {
	["pipeautorifle"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)

	if (client:GetCharacter():GetSkill("repair", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 100 * 20) then
			return true
		end
	end

	return false
	
end)



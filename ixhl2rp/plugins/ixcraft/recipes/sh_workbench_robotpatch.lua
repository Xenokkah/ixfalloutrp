RECIPE.name = "Robot Emergency Patch"
RECIPE.description = "Assemble a steel patch with adhesive packing for repairing minor damage to robots."
RECIPE.model = "models/mosi/fallout4/props/junk/applicator.mdl"
RECIPE.category = "Robot Repair"
RECIPE.requirements = {
	["adhesive"] = 1,
	["steel"] = 1

}

RECIPE.results = {
	["robotpatch"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 5) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



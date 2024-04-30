RECIPE.name = "Automatic Robot Repair Tool"
RECIPE.description = "Assemble a one-use welding tool for mending damage on robots that smartly detects when damage has been sustained and automatically activates."
RECIPE.model = "models/mosi/fallout4/props/aid/robotrepair.mdl"
RECIPE.category = "Robot Repair"
RECIPE.requirements = {
	["adhesive"] = 2,
	["steel"] = 1,
	["copper"] = 1,
	["screws"] = 2,
	["aluminum"] = 2,
	["circuitry"] = 2,


}

RECIPE.results = {
	["robotrepairtoolauto"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 15) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



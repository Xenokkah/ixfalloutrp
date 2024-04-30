RECIPE.name = "Robot Repair Tool"
RECIPE.description = "Assemble a one-use welding tool for mending damage on robots."
RECIPE.model = "models/mosi/fallout4/props/aid/robotrepair.mdl"
RECIPE.category = "Robot Repair"
RECIPE.requirements = {
	["adhesive"] = 2,
	["steel"] = 1,
	["copper"] = 1,
	["screws"] = 1,
	["aluminum"] = 1,

}

RECIPE.results = {
	["robotrepairtool"] = 1
}


RECIPE:PostHook("OnCanSee", function(recipeTable, client)
	if (client:GetCharacter():GetSkill("repair", 0) < 10) then 
		return false
	end 

	for _, v in pairs(ents.FindByClass("ix_station_workbench")) do
		if (client:GetPos():DistToSqr(v:GetPos()) < 200 * 40) then
			return true
		end
	end

	return false
	
end)



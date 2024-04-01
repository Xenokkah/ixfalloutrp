RECIPE.name = "Gun Cleaning Kit"
RECIPE.description = "Fashion a a full cleaning kit for restoring worn parts."
RECIPE.model = "models/mosi/fnv/props/health/repairkit.mdl"
RECIPE.category = "Weapon Repair"
RECIPE.requirements = {
	["adhesive"] = 1,
	["gunoil"] = 2,
	["cloth"] = 3,
	["plastic"] = 3,
}

RECIPE.blueprint = "weaponrepairblueprint"

RECIPE.results = {
	["guncleaningkit"] = 1
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



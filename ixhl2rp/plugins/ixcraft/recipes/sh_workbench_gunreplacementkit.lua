RECIPE.name = "Gun Parts Kit Kit"
RECIPE.description = "Put together a kit of replacement weapon parts for heavily damaged guns."
RECIPE.model = "models/mosi/fnv/props/health/repairkit.mdl"
RECIPE.category = "Weapon Repair"
RECIPE.requirements = {
	["adhesive"] = 2,
	["steel"] = 2,
	["aluminum"] = 2,
	["plastic"] = 2,
	["gears"] = 3,
	["springs"] = 3,
	["screws"] = 3,
}

RECIPE.blueprint = "weaponrepairblueprint"

RECIPE.results = {
	["gunreplacementkit"] = 1
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



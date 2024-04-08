RECIPE.name = "Disassemble 9mm Pistol"
RECIPE.description = "Disassemble a T1 Weapon."
RECIPE.model = "models/mosi/fnv/props/health/repairkit.mdl"
RECIPE.category = "Weapon Disassembly"
RECIPE.requirements = {
	["9mmpistol"] = 1,
}

RECIPE.blueprint = "gunsmithbook"

RECIPE.results = {
	["weaponpartsbasic"] = 1
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


